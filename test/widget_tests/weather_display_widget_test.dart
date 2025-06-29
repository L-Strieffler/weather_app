import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/weather/domain/entities/daily_weather_details.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_display_widget.dart';

void main() {
  testWidgets('WeatherDisplayWidget displays date, location, and temperature', (WidgetTester tester) async {
    // Arrange
    final dailyWeatherDetails = DailyWeatherDetails(
      date: DateTime(2025, 2, 8),
      temperature: 5.7,
      minTemperature: 2.0,
      maxTemperature: 8.0,
      humidity: 60,
      pressure: 1012,
      windSpeed: 3.5,
    );
    const location = 'Munich, Bavaria, Germany';

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WeatherDisplayWidget(
            dailyWeatherDetails: dailyWeatherDetails,
            location: location,
          ),
        ),
      ),
    );

    // Assert
    // Day of week (e.g. "Saturday")
    expect(find.text(DateFormat('EEEE').format(dailyWeatherDetails.date)), findsOneWidget);

    // Date (e.g. "2/8")
    expect(find.text(DateFormat('Md').format(dailyWeatherDetails.date)), findsOneWidget);

    // Location button label (first part before comma)
    expect(find.text('Munich'), findsOneWidget);

    // Temperature rounded and with degree symbol
    expect(find.text('${dailyWeatherDetails.temperature.toInt()}°'), findsOneWidget);
  });
}