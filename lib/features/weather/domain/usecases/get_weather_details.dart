import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/domain/usecase.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/weather/domain/entities/weather_details.dart';
import 'package:weather_app/features/weather/domain/repositories/repository.dart';

class GetWeatherDetails extends UseCase<WeatherDetails, Params> {
  final Repository repository;

  GetWeatherDetails(this.repository);

  @override
  Future<Either<Failure, WeatherDetails>> call(Params params) async {
    return await repository.getWeatherDetails(params.locationName);
  }
}

class Params extends Equatable {
  final String locationName;

  const Params({required this.locationName});

  @override
  List<Object?> get props => [locationName];
}
