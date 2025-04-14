import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/features/weather/data/datasources/remote_data_source.dart';
import 'package:weather_app/features/weather/data/models/weather_details_model.dart';

import '../../../../../fixtures/fixture_reader.dart';
@GenerateMocks([http.Client])
import 'remote_data_source_test.mocks.dart';

void main() {
  late RemoteDataSourceImpl dataSource;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    dataSource = RemoteDataSourceImpl(httpClient: mockClient);
  });

  group('getWeatherDetails', () {
    const tLocationName = 'New York, United States';
    var tUrl = Uri.https('api.tomorrow.io', '/v4/weather/forecast', {
      'location': tLocationName,
      'units': 'metric',
    });

    test('should perform a GET request on a URL with location name', () async {
      // arrange
      when(
        mockClient.get(any),
      ).thenAnswer((_) async => http.Response(fixture('weather_details.json'), 200));
      // act
      await dataSource.getWeatherDetails(tLocationName);
      // assert
      verify(mockClient.get(tUrl));
    });

    test('should return WeatherDetailsModel when the response code is 200', () async {
      // arrange
      when(
        mockClient.get(any),
      ).thenAnswer((_) async => http.Response(fixture('weather_details.json'), 200));
      // act
      final result = await dataSource.getWeatherDetails(tLocationName);
      // assert
      expect(result, isA<WeatherDetailsModel>());
    });

    test('should throw a ServerException when the response code is 400 or other', () async {
      // arrange
      when(
        mockClient.get(any),
      ).thenAnswer((_) async => http.Response('Not Found', 400));
      // act
      final call = dataSource.getWeatherDetails;
      // assert
      expect(() => call(tLocationName), throwsA(isA<ServerException>()));
    });
  });
}
