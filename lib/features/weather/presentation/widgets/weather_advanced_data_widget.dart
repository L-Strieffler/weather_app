import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/features/weather/domain/entities/daily_weather_details.dart';

class WeatherAdvancedDataWidget extends StatelessWidget {
  final DailyWeatherDetails dailyWeatherDetails;

  const WeatherAdvancedDataWidget({
    super.key,
    required this.dailyWeatherDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Divider(
            color: Theme.of(context).colorScheme.secondary,
            thickness: 1.5,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text('Humidity', style: const TextStyle(fontSize: 16)),
                Text(
                  '${dailyWeatherDetails.humidity} %',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            Column(
              children: [
                Text('Pressure', style: const TextStyle(fontSize: 16)),
                Text(
                  '${dailyWeatherDetails.pressure} hPa',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            Column(
              children: [
                Text('Wind', style: const TextStyle(fontSize: 16)),
                Text(
                  '${dailyWeatherDetails.windSpeed} m/s',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Divider(
            color: Theme.of(context).colorScheme.secondary,
            thickness: 1.5,
          ),
        ),
      ],
    );
  }
}
