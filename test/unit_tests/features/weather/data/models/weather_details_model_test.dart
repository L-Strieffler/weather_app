import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/weather/data/models/weather_details_model.dart';
import 'package:weather_app/features/weather/domain/entities/weather_details.dart';

import '../../../../../fixtures/fixture_reader.dart';
import '../../../../../fixtures/test_entities.dart';

void main() {
  final tWeatherDetailsModel = testWeatherDetailsModel();

  test('should be a subclass of WeatherDetails entity', () async {
    // assert
    expect(tWeatherDetailsModel, isA<WeatherDetails>());
  });

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap = jsonDecode(
        fixture('weather_details.json'),
      );
      // act
      final result = WeatherDetailsModel.fromJson(jsonMap);
      // assert
      expect(result, tWeatherDetailsModel);
    });
  });
}
