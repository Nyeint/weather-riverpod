import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherItemWidget extends StatelessWidget {
  final String title;
  final String info;
  WeatherItemWidget({required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 16,fontWeight: FontWeight.w500,
                color: Colors.grey),
          ),
          Padding(padding: EdgeInsets.only(top: 3)),
          Text(
          info,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 16,fontWeight: FontWeight.w500,
              color: Colors.black),
        )
        ],
      ),
    );
  }
}
