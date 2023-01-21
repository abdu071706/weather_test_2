import 'package:flutter/material.dart';
import 'package:weather_test_2/constants/app_colors.dart';
import 'package:weather_test_2/constants/text_styles.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({
    Key? key,
    required  temp,
    required  wind,
    required  humidity,
    required  pressure,
    required  cityName,
    required this.icons,
  }) : _temp = temp, _wind = wind, _humidity = humidity, _pressure = pressure, _cityName = cityName, super(key: key);

  final _temp;
  final  _wind;
  final  _humidity;
  final  _pressure;
  final  _cityName;
  final String icons;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          height: 1000,
          'assets/images/home_ui.jpg',
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 130,
          left: 160,
          child: Text(
            icons,
            style: TextStyle(fontSize:200, color: AppColors.white,fontWeight: FontWeight.bold),
          ),
        ),
          Positioned(
          top: 150,
          left: 50,
          child: Text('$_temp\u00B0  ', style: AppTextStyles.text8White),
        ),
          Positioned(
          top: 400,
          right: 200,
          child: Text(' Ветер🍃$_wind', style:AppTextStyles.text100White),
        ),
        Positioned(
          top: 470,
          right: 70,
          child: Row(
            children: [
              Text(' Влажность✨ $_humidity ', style: AppTextStyles.text100White),
            ],
          ),
        ),
        Positioned(
          top: 540,
          right: 50,
          child: Row(
            children: [
              Text('Давление🌡 $_pressure', style: AppTextStyles.text100White),
            ],
          ),
        ),
        Positioned(
          top: 800,
          right: 80,
          child: Text(
            _cityName,
            style: AppTextStyles.text50WhiteW800,
          ),
        ),
      ],
    );
  }
}