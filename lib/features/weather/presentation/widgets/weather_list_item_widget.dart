import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/domain/entities/daily_weather_details.dart';

class WeatherListItem extends StatelessWidget {
  final DailyWeatherDetails weatherDetails;
  final bool isSelected;

  const WeatherListItem({
    super.key,
    required this.weatherDetails,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: ColoredBox(
        color:
            isSelected
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.secondaryContainer,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherDetails.date.substring(0, 3),
                style: TextStyle(
                  color:
                      isSelected
                          ? Theme.of(context).colorScheme.onPrimaryContainer
                          : Theme.of(context).colorScheme.onSecondaryContainer,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.clip,
                softWrap: false,
              ),
              Text(
                '${weatherDetails.minTemperature.toInt()}°/${weatherDetails.maxTemperature.toInt()}°',
                style: TextStyle(
                  color:
                      isSelected
                          ? Theme.of(context).colorScheme.onPrimaryContainer
                          : Theme.of(context).colorScheme.onSecondaryContainer,
                  fontSize: 20,
                ),
                overflow: TextOverflow.clip,
                softWrap: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
