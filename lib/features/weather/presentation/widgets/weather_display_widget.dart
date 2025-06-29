import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/weather/domain/entities/daily_weather_details.dart';
import 'package:weather_app/features/weather/presentation/constants.dart';

class WeatherDisplayWidget extends StatelessWidget {
  final DailyWeatherDetails dailyWeatherDetails;
  final String location;

  const WeatherDisplayWidget({
    super.key,
    required this.dailyWeatherDetails,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime date = dailyWeatherDetails.date;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(ScalingParameter.padding),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('EEEE').format(date),
                  style: const TextStyle(
                    fontSize: ScalingParameter.fontSizeLarge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat('Md').format(date),
                  style: const TextStyle(
                    fontSize: ScalingParameter.fontSizeMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(ScalingParameter.padding),
          child: Align(
            alignment: Alignment.topLeft,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.location_pin),
              label: Text(location.split(',')[0]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(ScalingParameter.padding),
          child: Text(
            '${dailyWeatherDetails.temperature.toInt().toString()}°',
            style: const TextStyle(
              fontSize: ScalingParameter.fontSizeExtraLarge,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
