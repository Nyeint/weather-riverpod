class DailyModel {
  final int dt;
  final double dayTemp;
  final double nightTemp;
  final double temp;
  final double feelsLike;
  final double low;
  final double high;
  final String description;
  final double pressure;
  final double humidity;
  final double wind;
  final String icon;
  final String rain;

  DailyModel({required this.dt,required this.dayTemp,required this.nightTemp, required this.temp, required this.feelsLike, required this.low, required this.high,
    required this.description, required this.pressure, required this.humidity, required this.wind, required this.icon, required this.rain});

  factory DailyModel.fromJson(Map<String, dynamic> json) {
    return DailyModel(
      dt: json['dt'].toInt(),
      temp: json['temp']['day'].toDouble(),
      dayTemp: json['temp']['day'].toDouble(),
      nightTemp: json['temp']['night'].toDouble(),
      feelsLike: json['feels_like']['day'].toDouble(),
      low: json['temp']['min'].toDouble(),
      high: json['temp']['max'].toDouble(),
      description: json['weather'][0]['description'],
      pressure: json['pressure'].toDouble(),
      humidity: json['humidity'].toDouble(),
      wind: json['wind_speed'].toDouble(),
      icon: json['weather'][0]['icon'],
      rain: json['rain'].toString()
    );
  }
}