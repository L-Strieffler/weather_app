import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/weather/domain/entities/daily_weather_details.dart';
import 'package:weather_app/features/weather/domain/entities/weather_details.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_list_widget.dart';

// Dummy CarouselView for testing (replace with your actual CarouselView if needed)
class CarouselView extends StatelessWidget {
  final List<Widget> children;
  final void Function(int)? onTap;
  final double? itemExtent;

  const CarouselView({
    super.key,
    required this.children,
    this.onTap,
    this.itemExtent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < children.length; i++)
          GestureDetector(
            onTap: onTap != null ? () => onTap!(i) : null,
            child: SizedBox(
              width: itemExtent ?? 100,
              child: children[i],
            ),
          ),
      ],
    );
  }
}

void main() {
  testWidgets('WeatherListWidget displays all WeatherListItems and highlights selected', (WidgetTester tester) async {
    // Arrange
    final dailyWeatherDetails = [
      DailyWeatherDetails(
        date: DateTime(2025, 2, 8),
        temperature: 5.0,
        minTemperature: 2.0,
        maxTemperature: 8.0,
        humidity: 60,
        pressure: 1012,
        windSpeed: 3.5,
      ),
      DailyWeatherDetails(
        date: DateTime(2025, 2, 9),
        temperature: 6.0,
        minTemperature: 3.0,
        maxTemperature: 9.0,
        humidity: 65,
        pressure: 1015,
        windSpeed: 4.0,
      ),
    ];
    final weatherDetails = WeatherDetails(
      locationName: 'Munich, Bavaria, Germany',
      dailyWeatherDetails: dailyWeatherDetails,
    );
    int tappedIndex = -1;

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WeatherListWidget(
            onItemTap: (index) => tappedIndex = index,
            weatherDetails: weatherDetails,
            selectedIndex: 1,
          ),
        ),
      ),
    );

    // Assert
    // Both days should be present
    expect(find.text('Sat'), findsOneWidget);
    expect(find.text('Sun'), findsOneWidget);

    // Min/max temperatures for both items
    expect(find.text('2°/8°'), findsOneWidget);
    expect(find.text('3°/9°'), findsOneWidget);

    // Tap the first item and check callback
    await tester.tap(find.text('Sat'));
    expect(tappedIndex, 0);

    // Tap the second item and check callback
    await tester.tap(find.text('Sun'));
    expect(tappedIndex, 1);
  });
}