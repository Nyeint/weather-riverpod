import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/provider/weather_provider.dart';
import 'package:weather/view/widget/forecast_weather_widget.dart';

class WeatherForecast extends ConsumerWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastWeather=ref.watch(forecastWeatherProvider);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_rounded,color: Colors.black,),
            ),
            backgroundColor: Colors.white,
            title: Text('Weather Forecast',style: TextStyle(color: Colors.black,fontFamily: 'Rasa',fontSize: 20),),
          ),
          body: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              forecastWeather.when(
                  data: (data)=> ForecastWeatherWidget(weatherModel: data),
                  error: (error,__) => Text(error.toString()),
                  loading: ()=> Center(child: CircularProgressIndicator(),)),
            ],
          ),
        ));
  }
}
