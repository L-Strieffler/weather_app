import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/weather/domain/entities/daily_weather_details.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_list_item_widget.dart';

void main() {
  testWidgets('WeatherListItem displays day and min/max temperature', (
    WidgetTester tester,
  ) async {
    final dailyWeatherDetails = DailyWeatherDetails(
      date: DateTime(2025, 2, 8),
      temperature: 5.0,
      minTemperature: 2.0,
      maxTemperature: 8.0,
      humidity: 60,
      pressure: 1012,
      windSpeed: 3.5,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WeatherListItem(
            weatherDetails: dailyWeatherDetails,
            isSelected: true,
          ),
        ),
      ),
    );

    // Check day of week (short, e.g. "Sat")
    expect(
      find.text(
        DateFormat('EEEE').format(dailyWeatherDetails.date).substring(0, 3),
      ),
      findsOneWidget,
    );

    // Check min/max temperature
    expect(
      find.text(
        '${dailyWeatherDetails.minTemperature.toInt()}°/${dailyWeatherDetails.maxTemperature.toInt()}°',
      ),
      findsOneWidget,
    );
  });

  testWidgets('WeatherListItem applies selected styles', (
    WidgetTester tester,
  ) async {
    final dailyWeatherDetails = DailyWeatherDetails(
      date: DateTime(2025, 2, 8),
      temperature: 5.0,
      minTemperature: 2.0,
      maxTemperature: 8.0,
      humidity: 60,
      pressure: 1012,
      windSpeed: 3.5,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WeatherListItem(
            weatherDetails: dailyWeatherDetails,
            isSelected: true,
          ),
        ),
      ),
    );

    // Check if the background color is primaryContainer when selected
    expect(
      (tester.firstWidget(find.byType(ColoredBox)) as ColoredBox).color,
      Theme.of(
        tester.element(find.byType(WeatherListItem)),
      ).colorScheme.primaryContainer,
    );
  });

  testWidgets('WeatherListItem applies unselected styles', (
    WidgetTester tester,
  ) async {
    final dailyWeatherDetails = DailyWeatherDetails(
      date: DateTime(2025, 2, 8),
      temperature: 5.0,
      minTemperature: 2.0,
      maxTemperature: 8.0,
      humidity: 60,
      pressure: 1012,
      windSpeed: 3.5,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WeatherListItem(
            weatherDetails: dailyWeatherDetails,
            isSelected: false,
          ),
        ),
      ),
    );

    // Check if the background color is secondaryContainer when not selected
    expect(
      (tester.firstWidget(find.byType(ColoredBox)) as ColoredBox).color,
      Theme.of(
        tester.element(find.byType(WeatherListItem)),
      ).colorScheme.secondaryContainer,
    );
  });
}
