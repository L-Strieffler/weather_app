import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/features/weather/data/models/weather_details_model.dart';

abstract class RemoteDataSource {
  Future<WeatherDetailsModel> getWeatherDetails(String locationName);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client httpClient;

  RemoteDataSourceImpl({required this.httpClient});

  @override
  Future<WeatherDetailsModel> getWeatherDetails(String locationName) async {
    const String apiKey = String.fromEnvironment('WEATHER_KEY');
    var url = Uri.https('api.tomorrow.io', '/v4/weather/forecast', {
      'location': locationName,
      'units': 'metric',
      'apikey': apiKey,
    });
    final response = await httpClient.get(url);
    if (response.statusCode != 200) {
      throw ServerException();
    }
    return WeatherDetailsModel.fromJson(jsonDecode(response.body));
  }
}
