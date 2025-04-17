import 'package:intl/intl.dart';
import 'package:weather_app/features/weather/domain/entities/daily_weather_details.dart';

class DailyWeatherDetailsModel extends DailyWeatherDetails {
  const DailyWeatherDetailsModel({
    required super.date,
    required super.temperature,
    required super.humidity,
    required super.pressure,
    required super.windSpeed,
    required super.minTemperature,
    required super.maxTemperature,
  });

  factory DailyWeatherDetailsModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherDetailsModel(
      date: DateFormat('yMMMMEEEEd').format(DateTime.parse(json['time'] as String)),
      temperature: (json['values']['temperatureAvg'] as num).toDouble(),
      humidity: json['values']['humidityAvg'] as int,
      pressure: (json['values']['pressureSurfaceLevelAvg'] as num).toInt(),
      windSpeed: (json['values']['windSpeedAvg'] as num).toDouble(),
      minTemperature: (json['values']['temperatureMin'] as num).toDouble(),
      maxTemperature: (json['values']['temperatureMax'] as num).toDouble(),
    );
  }
}
