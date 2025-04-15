import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/weather/domain/entities/daily_weather_details.dart';
import 'package:weather_app/features/weather/domain/entities/weather_details.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather_details.dart';
import 'package:weather_app/features/weather/presentation/bloc/cubit/weather_cubit.dart';

import '../../../../../fixtures/test_entities.dart';
@GenerateMocks([GetWeatherDetails])
import 'weather_cubit_test.mocks.dart';

void main() {
  late WeatherCubit weatherCubit;
  late MockGetWeatherDetails mockGetWeatherDetails;

  setUp(() {
    mockGetWeatherDetails = MockGetWeatherDetails();
    weatherCubit = WeatherCubit(mockGetWeatherDetails);
  });

  const WeatherDetails tWeatherDetails = TestEntities.testWeatherDetailsModel;
  const DailyWeatherDetails tDailyWeatherDetails =
      TestEntities.testDailyWeatherDetailsModel;

  test('initialState should be Empty', () {
    // assert
    expect(
      weatherCubit.state,
      WeatherState(
        status: WeatherStatus.initial,
        errorMessage: '',
        weatherDetails: WeatherDetails.empty(),
        dailyWeatherDetails: DailyWeatherDetails.empty(),
      ),
    );
  });

  group('updateWeatherDetails', () {
    blocTest(
      'emits [loading, loaded] when data is gotten successfully',
      setUp:
          () => when(
            mockGetWeatherDetails.call(any),
          ).thenAnswer((_) async => Right(tWeatherDetails)),
      build: () => WeatherCubit(mockGetWeatherDetails),
      act: (bloc) => bloc.updateWeatherDetails('New York, United States'),
      expect:
          () => const <WeatherState>[
            WeatherState(status: WeatherStatus.loading),
            WeatherState(
              status: WeatherStatus.loaded,
              weatherDetails: tWeatherDetails,
            ),
          ],
    );

    blocTest(
      'emits [loading, error] when getting data fails',
      setUp:
          () => when(
            mockGetWeatherDetails.call(any),
          ).thenAnswer((_) async => Left(ServerFailure())),
      build: () => WeatherCubit(mockGetWeatherDetails),
      act: (bloc) => bloc.updateWeatherDetails('New York, United States'),
      expect:
          () => const <WeatherState>[
            WeatherState(status: WeatherStatus.loading),
            WeatherState(status: WeatherStatus.error, errorMessage: 'Error'),
          ],
    );
  });

  group('updateDailyWeatherDetails', () {
    blocTest(
      'emits [loading, loaded] with updated dailyWeatherDetails',
      build: () => WeatherCubit(mockGetWeatherDetails),
      act: (bloc) => bloc.updateDailyWeatherDetails(6),
      expect:
          () => const <WeatherState>[
            WeatherState(status: WeatherStatus.loading),
            WeatherState(
              status: WeatherStatus.loaded,
              dailyWeatherDetails: tDailyWeatherDetails,
            ),
          ],
    );
  });
}
