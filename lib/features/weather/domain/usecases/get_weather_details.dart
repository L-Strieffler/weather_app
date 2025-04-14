import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/features/weather/domain/entities/weather_details.dart';
import 'package:weather_app/features/weather/domain/repositories/repository.dart';

class GetWeatherDetails {
  final Repository repository;

  GetWeatherDetails(this.repository);

  Future<Either<Failure, WeatherDetails>> call(String locationName) async {
    return await repository.getWeatherDetails(locationName);
  }
}