import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather/domain/entities/daily_weather_details.dart';

class WeatherDetails extends Equatable {
  final String locationName;
  final List<DailyWeatherDetails> dailyWeatherDetails;

  const WeatherDetails({
    required this.locationName,
    required this.dailyWeatherDetails,
  });

  @override
  List<Object?> get props => [locationName, dailyWeatherDetails];
}
