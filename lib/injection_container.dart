import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:weather_app/core/platform/network_info.dart';
import 'package:weather_app/features/weather/data/datasources/remote_data_source.dart';
import 'package:weather_app/features/weather/data/repositories/repository_impl.dart';
import 'package:weather_app/features/weather/domain/repositories/repository.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather_details.dart';
import 'package:weather_app/features/weather/presentation/bloc/cubit/weather_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Weather
  // Bloc
  sl.registerFactory(() => WeatherCubit(sl()));
  // Use cases
  sl.registerLazySingleton(() => GetWeatherDetails(sl()));
  // Repository
  sl.registerLazySingleton<Repository>(
    () => RepositoryImpl(remoteDataSource: sl(), networkInfo: sl()),
  );
  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(httpClient: sl()),
  );
  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(internetConnection: sl()));
  sl.registerLazySingleton(() => InternetConnection());
}
