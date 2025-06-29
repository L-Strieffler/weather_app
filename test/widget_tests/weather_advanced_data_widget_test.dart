import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/weather/domain/entities/daily_weather_details.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_advanced_data_widget.dart';

void main() {
  testWidgets('WeatherAdvancedDataWidget displays humidity, pressure, and wind', (WidgetTester tester) async {
    // Arrange
    final dailyWeatherDetails = DailyWeatherDetails(
      date: DateTime(2025, 2, 8),
      temperature: 5.0,
      minTemperature: 2.0,
      maxTemperature: 8.0,
      humidity: 60,
      pressure: 1012,
      windSpeed: 3.5,
    );

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WeatherAdvancedDataWidget(dailyWeatherDetails: dailyWeatherDetails),
        ),
      ),
    );

    // Assert
    expect(find.text('Humidity'), findsOneWidget);
    expect(find.text('Pressure'), findsOneWidget);
    expect(find.text('Wind'), findsOneWidget);

    expect(find.text('${dailyWeatherDetails.humidity} %'), findsOneWidget);
    expect(find.text('${dailyWeatherDetails.pressure} hPa'), findsOneWidget);
    expect(find.text('${dailyWeatherDetails.windSpeed} m/s'), findsOneWidget);
  });
}