import 'package:weather/network/api/weather_api.dart';
import '../../model/forecast_model.dart';
import '../../model/weather_model.dart';

class WeatherRepository{
  final WeatherApi weatherApi;
  WeatherRepository(this.weatherApi);

  Future<WeatherModel> getCurrentWeather({required String lat,required String lon}) async {
    return weatherApi.getCurrentWeather(lat: lat,lon: lon);
  }
  Future<ForecastModel> getForecastWeather({required String lat,required String lon}) async {
    return weatherApi.getForecastWeather(lat: lat,lon: lon);
  }
}