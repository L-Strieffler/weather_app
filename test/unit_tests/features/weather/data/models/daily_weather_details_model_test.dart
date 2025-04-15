import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/weather/data/models/daily_weather_details_model.dart';
import 'package:weather_app/features/weather/domain/entities/daily_weather_details.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final tWeatherDetailsModel = DailyWeatherDetailsModel(
    day: 'Friday',
    temperature: -6.7,
    humidity: 66,
    pressure: 1018,
    windSpeed: 3.5,
    minTemperature: -9.8,
    maxTemperature: -4.3,
  );

  test('should be a subclass of WeatherDetails entity', () async {
    // assert
    expect(tWeatherDetailsModel, isA<DailyWeatherDetails>());
  });

  group('should return a valid model', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap = jsonDecode(
        fixture('daily_weather_details.json'),
      );
      // act
      final result = DailyWeatherDetailsModel.fromJson(jsonMap);
      // assert
      expect(result, tWeatherDetailsModel);
    });
  });
}
