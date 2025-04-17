import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/cubit/weather_cubit.dart';
import 'package:weather_app/features/weather/presentation/screens/error_screen.dart';
import 'package:weather_app/features/weather/presentation/screens/weather_screen.dart';
import 'package:weather_app/injection_container.dart' as di;

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBody(context));
  }

  BlocProvider<WeatherCubit> buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<WeatherCubit>()..updateWeatherDetails(),
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (BuildContext context, WeatherState state) {
          return RefreshIndicator(
            onRefresh: () async {
              await context.read<WeatherCubit>().updateWeatherDetails();
            },
            child:
                state.status == WeatherStatus.loaded
                    ? LayoutBuilder(
                      builder: (context, constraints) {
                        return WeatherScreen(
                          onItemTap: (index) {
                            context
                                .read<WeatherCubit>()
                                .updateDailyWeatherDetails(index);
                          },
                          weatherDetails: state.weatherDetails,
                          selectedIndex: state.index,
                          constraints: constraints,
                        );
                      },
                    )
                    : state.status == WeatherStatus.error
                    ? ErrorScreen(
                      onRetry: () {
                        context.read<WeatherCubit>().updateWeatherDetails();
                      },
                    )
                    : const Scaffold(),
          );
        },
      ),
    );
  }
}
