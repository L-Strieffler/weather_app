import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/pages/weather_page.dart';
import 'package:weather_app/injection_container.dart' as di;

void main() async {
  await di.init(); // Initialize the dependency injection
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.light,
        ),
      ),
      home: WeatherPage(),
    );
  }
}
