part of 'weather_cubit.dart';

enum WeatherStatus { initial, loading, loaded, error }

class WeatherState extends Equatable {
  final WeatherStatus status;
  final String errorMessage;
  final WeatherDetails weatherDetails;
  final DailyWeatherDetails dailyWeatherDetails;

  const WeatherState({
    this.status = WeatherStatus.initial,
    this.errorMessage = '',
    this.weatherDetails = const WeatherDetails.empty(),
    this.dailyWeatherDetails = const DailyWeatherDetails.empty(),
  });

  @override
  List<Object> get props => [
    status,
    errorMessage,
    weatherDetails,
    dailyWeatherDetails,
  ];
}
