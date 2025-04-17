part of 'weather_cubit.dart';

enum WeatherStatus { initial, loading, loaded, error }

class WeatherState extends Equatable {
  final WeatherStatus status;
  final String errorMessage;
  final WeatherDetails weatherDetails;
  final int index;

  const WeatherState({
    this.status = WeatherStatus.initial,
    this.errorMessage = '',
    this.weatherDetails = const WeatherDetails.empty(),
    this.index = 0,
  });

  WeatherState copyWith({
    WeatherStatus? status,
    String? errorMessage,
    WeatherDetails? weatherDetails,
    int? index,
  }) {
    return WeatherState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      weatherDetails: weatherDetails ?? this.weatherDetails,
      index: index ?? this.index,
    );
  }

  @override
  List<Object> get props => [
    status,
    errorMessage,
    weatherDetails,
    index,
  ];
}
