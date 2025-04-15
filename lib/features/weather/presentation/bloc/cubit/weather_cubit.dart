import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather/domain/entities/daily_weather_details.dart';
import 'package:weather_app/features/weather/domain/entities/weather_details.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherState(status: WeatherStatus.initial));
}
