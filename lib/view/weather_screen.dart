import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather/provider/weather_provider.dart';
import 'package:weather/view/widget/current_weather_widget.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeather=ref.watch(currentWeatherProvider);
    return SafeArea(
        child: Scaffold(
            body: Column(
              children: [
                currentWeather.when(
                    data: (data)=> CurrentWeatherWidget(weatherModel: data),
                    error: (error,__) => Text(error.toString()),
                    loading: ()=> Center(child: CircularProgressIndicator(),)),
                Padding(padding: EdgeInsets.only(top: 20)),
                GestureDetector(
                  onTap: () => context.go('/forecast'),
                  child: Text("Next 7 Days >",style: TextStyle(fontFamily: 'Rasa',fontSize: 18,),),
                ),
              ],
            )
    ));
  }
}
