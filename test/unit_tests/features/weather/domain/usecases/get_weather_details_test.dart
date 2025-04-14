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
    locationName: 'New York, United States',
    dailyWeatherDetails: [],
  );

  test('should get weather details from the repository', () async {
    // arrange
    when(
      mockRepository.getWeatherDetails(any),
    ).thenAnswer((_) async => Right(tWeatherDetails));
    // act
    final result = await usecase(
      Params(locationName: 'New York, United States'),
    );
    // assert
    expect(result, Right(tWeatherDetails));
    verify(mockRepository.getWeatherDetails('New York, United States'));
    verifyNoMoreInteractions(mockRepository);
  });
}
