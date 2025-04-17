import 'package:flutter/material.dart';

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
            padding: const EdgeInsets.all(8.0),
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
