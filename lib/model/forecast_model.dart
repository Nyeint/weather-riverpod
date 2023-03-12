import 'daily_model.dart';

class ForecastModel {
  final List<DailyModel> daily;

  ForecastModel({required this.daily});

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> dailyData = json['daily'];

    List<DailyModel> daily = <DailyModel>[];

    dailyData.forEach((item) {
      var day = DailyModel.fromJson(item);
      daily.add(day);
    });

    return ForecastModel(
      daily: daily
    );
  }
}