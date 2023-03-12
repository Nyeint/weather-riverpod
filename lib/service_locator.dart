import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/network/api/weather_api.dart';
import 'package:weather/network/dio_client.dart';
import 'package:weather/network/repository/weather_repository.dart';

import 'di/network_module.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {

  getIt.registerSingleton<Dio>(NetworkModule.provideDio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));

  // api's:---------------------------------------------------------------------
  getIt.registerSingleton(WeatherApi(getIt<DioClient>()));

  //repository
  getIt.registerSingleton<WeatherRepository>(WeatherRepository(getIt<WeatherApi>()));
}

// Future<void> setupLocator() async {
//   getIt.registerSingleton(WeatherApiClient());
//   getIt.registerSingleton<WeatherRepository>(WeatherRepository(getIt<WeatherApiClient>()));
//
// }