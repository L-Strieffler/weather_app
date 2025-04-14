import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/weather/domain/entities/weather_details.dart';

abstract class Repository{
  Future<Either<Failure, WeatherDetails>> getWeatherDetails(String locationName);
}