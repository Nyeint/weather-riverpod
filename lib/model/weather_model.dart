class WeatherModel {
  final int weather_id;
  final double temp;
  final double feelsLike;
  final double low;
  final double high;
  final String description;
  final double pressure;
  final double humidity;
  final double wind;
  final String icon;

  WeatherModel({required this.weather_id,required this.temp,required this.feelsLike,required this.low,required this.high,
    required this.description,required this.pressure,required this.humidity,required this.wind,required this.icon});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      weather_id: json['weather'][0]['id'],
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      low: json['main']['temp_min'].toDouble(),
      high: json['main']['temp_max'].toDouble(),
      description: json['weather'][0]['description'],
      pressure: json['main']['pressure'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
      wind: json['wind']['speed'].toDouble(),
      icon: json['weather'][0]['icon'],
    );
  }
}