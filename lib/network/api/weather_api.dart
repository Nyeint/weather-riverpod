import 'dart:convert';
import 'package:weather/data/endpoints.dart';

import '../../model/forecast_model.dart';
import '../../model/weather_model.dart';
import '../dio_client.dart';

class WeatherApi {
  final DioClient _dioClient;
  WeatherApi(this._dioClient);

  Future<WeatherModel> getCurrentWeather({required lat, required lon}) async{
    String apiKey = "a4c9925585e92cd21138bd7aa14465e5";
    final res = await _dioClient.get(Endpoints.currentWeather+"?units=imperial&lat=$lat&lon=$lon&appid=$apiKey");
    return WeatherModel.fromJson(res);
  }

  Future<ForecastModel> getForecastWeather({required lat, required lon}) async{
    String apiKey = "a4c9925585e92cd21138bd7aa14465e5";
    final res = await _dioClient.get(Endpoints.forecastWeather+"?lat=$lat&lon=$lon&appid=$apiKey&units='metric'");
    return ForecastModel.fromJson(res);
  }
}