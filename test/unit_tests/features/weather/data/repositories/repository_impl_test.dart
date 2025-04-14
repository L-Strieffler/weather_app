import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/platform/network_info.dart';
import 'package:weather_app/features/weather/data/datasources/remote_data_source.dart';
import 'package:weather_app/features/weather/data/models/weather_details_model.dart';
import 'package:weather_app/features/weather/data/repositories/repository_impl.dart';
import 'package:weather_app/features/weather/domain/entities/weather_details.dart';

@GenerateMocks([RemoteDataSource, NetworkInfo])
import 'repository_impl_test.mocks.dart';

void main() {
  late RepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = RepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getWeatherDetails', () {
    const tLocationName = 'New York, United States';
    final WeatherDetailsModel tWeatherDetailsModel = WeatherDetailsModel(
      locationName: tLocationName,
      dailyWeatherDetails: [],
    );
    final WeatherDetails tWeatherDetails = tWeatherDetailsModel;

    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getWeatherDetails(tLocationName);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(
            mockRemoteDataSource.getWeatherDetails(any),
          ).thenAnswer((_) async => Future.value(tWeatherDetailsModel));
          // act
          final Either<Failure, WeatherDetails> result = await repository
              .getWeatherDetails(tLocationName);
          // assert
          verify(mockRemoteDataSource.getWeatherDetails(tLocationName));
          expect(result, Right(tWeatherDetails));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(
            mockRemoteDataSource.getWeatherDetails(any),
          ).thenThrow(ServerException());
          // act
          final result = await repository.getWeatherDetails(tLocationName);
          // assert
          verify(mockRemoteDataSource.getWeatherDetails(tLocationName));
          expect(result, Left(ServerFailure()));
        },
      );
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test(
        'should return a connection failure when the device is offline',
        () async {
          // act
          final result = await repository.getWeatherDetails(tLocationName);
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          expect(result, Left(ConnectionFailure()));
        },
      );
    });
  });
}
