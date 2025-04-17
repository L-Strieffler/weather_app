import 'package:flutter/widgets.dart';
import 'package:weather_app/features/weather/domain/entities/weather_details.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_advanced_data_widget.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_display_widget.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_list_widget.dart';

class WeatherScreen extends StatelessWidget {
  final void Function(int selectedIndex) onItemTap;
  final WeatherDetails weatherDetails;
  final int selectedIndex;
  final BoxConstraints constraints;

  const WeatherScreen({
    super.key,
    required this.onItemTap,
    required this.weatherDetails,
    required this.selectedIndex,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: constraints.maxHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WeatherDisplayWidget(
              dailyWeatherDetails:
                  weatherDetails.dailyWeatherDetails[selectedIndex],
              location: weatherDetails.locationName,
            ),
            WeatherAdvancedDataWidget(
              dailyWeatherDetails:
                  weatherDetails.dailyWeatherDetails[selectedIndex],
            ),
            WeatherListWidget(
              onItemTap: (value) => onItemTap(value),
              weatherDetails: weatherDetails,
              selectedIndex: selectedIndex,
            ),
          ],
        ),
      ),
    );
  }
}
