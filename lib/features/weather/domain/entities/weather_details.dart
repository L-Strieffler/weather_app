import 'package:equatable/equatable.dart';

class WeatherDetails extends Equatable {
  final String locationName;
  final DateTime date;
  final double temperature;
  final int humidity;
  final double pressure;
  final double windSpeed;

  const WeatherDetails({
    required this.locationName,
    required this.date,
    required this.temperature,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
  });

  @override
  List<Object?> get props => [
    locationName,
    date,
    temperature,
    humidity,
    pressure,
    windSpeed,
  ];
}
