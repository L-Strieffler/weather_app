import 'package:const_date_time/const_date_time.dart';
import 'package:weather_app/features/weather/data/models/daily_weather_details_model.dart';
import 'package:weather_app/features/weather/data/models/weather_details_model.dart';

class TestEntities {
  static const testWeatherDetailsModel = WeatherDetailsModel(
    locationName: 'New York, United States',
    dailyWeatherDetails: [
      DailyWeatherDetailsModel(
        date: ConstDateTime(2025, 2, 8, 12, 0, 0),
        temperature: -3.2,
        humidity: 77,
        pressure: 1004,
        windSpeed: 4.9,
        minTemperature: -5.6,
        maxTemperature: -1.7,
      ),
      DailyWeatherDetailsModel(
        date: ConstDateTime(2025, 2, 9, 12, 0, 0),
        temperature: -1.5,
        humidity: 72,
        pressure: 1005,
        windSpeed: 6.2,
        minTemperature: -4.1,
        maxTemperature: 0.4,
      ),
      DailyWeatherDetailsModel(
        date: ConstDateTime(2025, 2, 10, 12, 0, 0),
        temperature: -4.1,
        humidity: 69,
        pressure: 1013,
        windSpeed: 4.4,
        minTemperature: -5.5,
        maxTemperature: -2.0,
      ),
      DailyWeatherDetailsModel(
        date: ConstDateTime(2025, 2, 11, 12, 0, 0),
        temperature: -2.5,
        humidity: 67,
        pressure: 1010,
        windSpeed: 2.8,
        minTemperature: -7.0,
        maxTemperature: 0.4,
      ),
      DailyWeatherDetailsModel(
        date: ConstDateTime(2025, 2, 12, 12, 0, 0),
        temperature: -2.5,
        humidity: 66,
        pressure: 1006,
        windSpeed: 3.8,
        minTemperature: -8.0,
        maxTemperature: -0.1,
      ),
      DailyWeatherDetailsModel(
        date: ConstDateTime(2025, 2, 13, 12, 0, 0),
        temperature: -0.8,
        humidity: 67,
        pressure: 1002,
        windSpeed: 5.2,
        minTemperature: -6.0,
        maxTemperature: 4.6,
      ),
      DailyWeatherDetailsModel(
        date: ConstDateTime(2025, 2, 14, 12, 0, 0),
        temperature: -6.7,
        humidity: 66,
        pressure: 1018,
        windSpeed: 3.5,
        minTemperature: -9.8,
        maxTemperature: -4.3,
      ),
    ],
  );

  static const testDailyWeatherDetailsModel = DailyWeatherDetailsModel(
    date: ConstDateTime(2025, 2, 14, 12, 0, 0),
    temperature: -6.7,
    humidity: 66,
    pressure: 1018,
    windSpeed: 3.5,
    minTemperature: -9.8,
    maxTemperature: -4.3,
  );
}
