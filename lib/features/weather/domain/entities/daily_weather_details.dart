import 'package:equatable/equatable.dart';

class DailyWeatherDetails extends Equatable {
  final DateTime date;
  final double temperature;
  final int humidity;
  final int pressure;
  final double windSpeed;
  final double minTemperature;
  final double maxTemperature;

  const DailyWeatherDetails({
    required this.date,
    required this.temperature,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.minTemperature,
    required this.maxTemperature,
  });

  @override
  List<Object?> get props => [
    date,
    temperature,
    humidity,
    pressure,
    windSpeed,
    minTemperature,
    maxTemperature,
  ];
}
