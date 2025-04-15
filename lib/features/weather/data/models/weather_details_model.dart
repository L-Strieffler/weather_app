import 'package:weather_app/features/weather/data/models/daily_weather_details_model.dart';
import 'package:weather_app/features/weather/domain/entities/weather_details.dart';

class WeatherDetailsModel extends WeatherDetails {
  const WeatherDetailsModel({
    required super.locationName,
    required super.dailyWeatherDetails,
  });

  factory WeatherDetailsModel.fromJson(Map<String, dynamic> json) {
    return WeatherDetailsModel(
      locationName: json['location']['name'],
      dailyWeatherDetails: (json['timelines']['daily'] as List)
          .map((e) => DailyWeatherDetailsModel.fromJson(e))
          .toList(),
    );
  }
}
