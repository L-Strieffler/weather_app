import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/constants.dart';

class ErrorScreen extends StatelessWidget {
  final void Function() onRetry;

  const ErrorScreen({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(ScalingParameter.padding),
            child: Text(
              'Retrieving weather data failed',
              style: const TextStyle(color: Colors.red),
            ),
          ),
          ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
