import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/domain/entities/weather_details.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_list_item_widget.dart';

class WeatherListWidget extends StatelessWidget {
  final void Function(int index) onItemTap;
  final WeatherDetails weatherDetails;
  final int selectedIndex;

  const WeatherListWidget({
    super.key,
    required this.onItemTap,
    required this.weatherDetails,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 100.0,
      child: CarouselView(
        onTap: (value) => onItemTap(value),
        itemExtent: 150.0,
        children: [
          for (int i = 0; i < weatherDetails.dailyWeatherDetails.length; i++)
            WeatherListItem(
              weatherDetails: weatherDetails.dailyWeatherDetails[i],
              isSelected: i == selectedIndex,
            ),
        ],
      ),
    );
  }
}
