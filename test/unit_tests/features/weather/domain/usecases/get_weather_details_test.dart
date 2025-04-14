import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/weather/domain/entities/weather_details.dart';
import 'package:weather_app/features/weather/domain/repositories/repository.dart';

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather_details.dart';

@GenerateMocks([Repository])
import 'get_weather_details_test.mocks.dart';

void main() {
  late GetWeatherDetails usecase;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    usecase = GetWeatherDetails(mockRepository);
  });

  final tWeatherDetails = WeatherDetails(
    locationName: 'Cairo',
    date: DateTime(2020, 1, 1, 10, 0),
    pressure: 1013.0,
    temperature: 30.0,
    humidity: 50,
    windSpeed: 10.0,
  );

  test('should get weather details from the repository', () async {
    // arrange
    when(mockRepository.getWeatherDetails(any))
        .thenAnswer((_) async => Right(tWeatherDetails));
    // act
    final result = await usecase('Cairo');
    // assert
    expect(result, Right(tWeatherDetails));
    verify(mockRepository.getWeatherDetails('Cairo'));
    verifyNoMoreInteractions(mockRepository);
  });
}
