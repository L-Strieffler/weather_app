import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/weather/domain/entities/daily_weather_details.dart';

abstract class Repository{
  Future<Either<Failure, DailyWeatherDetails>> getWeatherDetails(String locationName);
}