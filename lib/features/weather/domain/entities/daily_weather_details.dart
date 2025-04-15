import 'package:equatable/equatable.dart';

class DailyWeatherDetails extends Equatable {
  final String day;
  final double temperature;
  final int humidity;
  final int pressure;
  final double windSpeed;
  final double minTemperature;
  final double maxTemperature;

  const DailyWeatherDetails({
    required this.day,
    required this.temperature,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.minTemperature,
    required this.maxTemperature,
  });

  const DailyWeatherDetails.empty()
      : day = '',
        temperature = 0.0,
        humidity = 0,
        pressure = 0,
        windSpeed = 0.0,
        minTemperature = 0.0,
        maxTemperature = 0.0;

  @override
  List<Object?> get props => [
    day,
    temperature,
    humidity,
    pressure,
    windSpeed,
    minTemperature,
    maxTemperature,
  ];
}
