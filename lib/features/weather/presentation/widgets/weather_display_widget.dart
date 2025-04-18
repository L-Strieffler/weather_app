import 'package:flutter/material.dart';
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
    final String date = dailyWeatherDetails.date;
    final List<String> parts = date.split(',');
    final String day = parts[0];
    final String dateDetails =
        parts.length > 1 ? parts.sublist(1).join(',') : '';
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
                  day,
                  style: const TextStyle(
                    fontSize: ScalingParameter.fontSizeLarge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dateDetails,
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
