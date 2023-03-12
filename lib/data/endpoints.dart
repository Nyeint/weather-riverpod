class Endpoints{
  // base url
  static const String baseUrl = "https://api.openweathermap.org/data/2.5/";

  static const String currentWeather = baseUrl+ "weather";
  static const String forecastWeather = baseUrl+"onecall";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout[kwf]
  static const int connectionTimeout = 30000;
}