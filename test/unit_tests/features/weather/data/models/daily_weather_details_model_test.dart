import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/weather/data/models/daily_weather_details_model.dart';
import 'package:weather_app/features/weather/domain/entities/daily_weather_details.dart';

import '../../../../../fixtures/fixture_reader.dart';
import '../../../../../fixtures/test_entities.dart';

void main() {
  final tWeatherDetailsModel = testDailyWeatherDetailsModel();
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
