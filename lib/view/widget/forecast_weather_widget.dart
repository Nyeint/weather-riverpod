import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/model/forecast_model.dart';

class ForecastWeatherWidget extends StatelessWidget {
  final ForecastModel weatherModel;
  ForecastWeatherWidget({required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: weatherModel.daily.length,
          itemBuilder: (BuildContext context, int index) {
            return
              index==0?Container():
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('${((weatherModel.daily[index].dayTemp-32)*5/9).toInt()} °C',
                                      style: TextStyle(color: Color(0xff334A52),fontFamily: 'Oswald',fontSize: 18,)),
                                  Padding(padding: EdgeInsets.only(left: 10)),
                                  Text('${((weatherModel.daily[index].nightTemp-32)*5/9).toInt()} °',
                                    style: TextStyle(color: Color(0xffBCBCBC),fontFamily: 'Oswald',fontSize: 16),),
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rain", style: TextStyle(color: Color(0xffBCBCBC),fontSize: 18,fontFamily: 'MyanmarSansPro'),
                              ),
                              Text(weatherModel.daily[index].rain=="null"?"_":
                              '${(double.parse(weatherModel.daily[index].rain)*100).toInt()} %',
                                  style: TextStyle(color: Color(0xff334A52),fontFamily: 'Oswald',fontSize: 16,)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Wind",style: TextStyle(color: Color(0xffBCBCBC),fontSize: 18,fontFamily: 'MyanmarSansPro'),
                              ),
                              Text(
                                  '${weatherModel.daily[index].wind} m/h',
                                  style:TextStyle(color: Color(0xff334A52),fontFamily: 'Oswald',fontSize: 16,)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Humidity",
                                style: TextStyle(color: Color(0xffBCBCBC),fontSize: 18,fontFamily: 'MyanmarSansPro'),
                              ),
                              Text(
                                  '${weatherModel.daily[index].humidity.toInt()} %',
                                  style: TextStyle(color: Color(0xff334A52),fontFamily: 'Oswald',fontSize: 16,)),
                            ],
                          )
                        ]),
                  ),
                  Divider()
                ],
              );
          }),
    );
  }
}