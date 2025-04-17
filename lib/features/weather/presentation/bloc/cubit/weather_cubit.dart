import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/features/weather/domain/entities/weather_details.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather_details.dart'
    as get_weather_details;

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final get_weather_details.GetWeatherDetails getWeatherDetails;

  WeatherCubit(this.getWeatherDetails)
    : super(WeatherState(status: WeatherStatus.initial));

  Future<void> updateWeatherDetails({
    String locationName = 'munich, bavaria, germany',
  }) async {
    emit(state.copyWith(status: WeatherStatus.loading));

    final result = await getWeatherDetails.call(
      get_weather_details.Params(locationName: locationName),
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(status: WeatherStatus.error, errorMessage: 'Error'),
        );
      },
      (weatherDetails) {
        emit(
          state.copyWith(
            status: WeatherStatus.loaded,
            weatherDetails: weatherDetails,
            index: 0,
          ),
        );
      },
    );
  }

  void updateDailyWeatherDetails(int index) {
    emit(state.copyWith(status: WeatherStatus.loading));
    emit(state.copyWith(status: WeatherStatus.loaded, index: index));
  }
}
