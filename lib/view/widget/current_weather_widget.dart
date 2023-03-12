import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/view/widget/weather_item_widget.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherModel weatherModel;
  CurrentWeatherWidget({required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // "{weather}",
                    weatherModel.description.toString(),
                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                  ),
                  Padding(padding: EdgeInsets.only(top: 7)),
                  Text(DateFormat('E, d MMM y').format(DateTime.now()).toString(),style: TextStyle(color: Color(0xff555555),fontSize: 18,),),
                ],
              ),
              Text( "${((weatherModel.temp-32)*5/9).toInt()}°C",style: TextStyle(color:Color(0xff334A52),fontSize: 33,fontFamily: 'Oswald'),)
            ],
          ),
        ),
        Container(
          // color: Colors.yellow,
          width: MediaQuery.of(context).size.width*0.8,
          height: MediaQuery.of(context).size.height*0.3  ,
          child:Image.asset('assets/images/${getWeatherImage(weatherModel.icon)}.png'),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, top: 15, bottom: 15, right: 10),
          margin: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff989898),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 3),
                )
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WeatherItemWidget(title: "Wind", info: "${weatherModel.wind} m/h"),
              WeatherItemWidget(title: "Humidity", info: "${weatherModel.humidity.toInt()}%"),
              WeatherItemWidget(title: "Pressure", info: "${weatherModel.pressure} hPa"),
              WeatherItemWidget(title: "Feels like", info: "${((weatherModel.feelsLike-32)*5/9).toInt()}°C"),
            ],
          ),
        )
      ],
    );
  }
}

String getWeatherImage(String _icon) {
  String imgUrl='http://openweathermap.org/img/wn/$_icon@2x.png';
  String getData=_icon.substring(0,2);
  switch(getData){
    case '01':
      return 'clearsky';
    case '02':
      return 'few_cloud';
    case '03':
      return 'cloudy';
    case '04':
      return 'cloudy';
    case '09':
      return 'raining';
    case '10':
      return 'raining';
    case '11':
      return 'thunder';
    case '13':
      return 'snow';
    case '50':
      return 'mist';
  }
  return "nocondition";
}