import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/domain/entities/daily_weather_details.dart';
import 'package:weather_app/features/weather/presentation/constants.dart';

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
          padding: const EdgeInsets.only(
            top: ScalingParameter.padding,
            bottom: ScalingParameter.padding,
          ),
          child: Divider(
            color: Theme.of(context).colorScheme.secondary,
            thickness: ScalingParameter.dividerThickness,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  'Humidity',
                  style: const TextStyle(fontSize: ScalingParameter.fontSize),
                ),
                Text(
                  '${dailyWeatherDetails.humidity} %',
                  style: const TextStyle(fontSize: ScalingParameter.fontSize),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Pressure',
                  style: const TextStyle(fontSize: ScalingParameter.fontSize),
                ),
                Text(
                  '${dailyWeatherDetails.pressure} hPa',
                  style: const TextStyle(fontSize: ScalingParameter.fontSize),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Wind',
                  style: const TextStyle(fontSize: ScalingParameter.fontSize),
                ),
                Text(
                  '${dailyWeatherDetails.windSpeed} m/s',
                  style: const TextStyle(fontSize: ScalingParameter.fontSize),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: ScalingParameter.padding,
            bottom: ScalingParameter.padding,
          ),
          child: Divider(
            color: Theme.of(context).colorScheme.secondary,
            thickness: ScalingParameter.dividerThickness,
          ),
        ),
      ],
    );
  }
}
