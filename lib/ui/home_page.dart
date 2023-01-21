import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather_test_2/data/widget/geo_locaation.dart';
import 'package:weather_test_2/data/widget/stack_widget.dart';
import 'package:weather_test_2/ui/search_page.dart';
import 'package:weather_test_2/weather_utils.dart';



class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  dynamic _cityName = '';
  dynamic _temp = '';
  dynamic _humidity = '';
  dynamic _pressure = '';
  dynamic _feels_like = '';
  dynamic _wind;
  String _icon = '';

  @override
  void initState() {
    showWeatherByLocation();
    super.initState();
  }

  showWeatherByLocation() async {
    final position = await GeoLocation().getPosition();
    await getWeatherByLocation(position);
  }

  Future<Map<String, dynamic>> getWeatherByLocation(Position position) async {
    final http = Client();
    Uri uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=4ff04e40a38fde16e99e9f0911394214');
    try {
      var response = await http.get(uri);
      // log('jooop ====> ${response.data}');
      final maalymat = jsonDecode(response.body);
      _cityName = maalymat['name'];
      final kelvin = maalymat['main']['temp'];
      _humidity = maalymat['main']['humidity'];
      _pressure = maalymat['main']['pressure'];
      _wind = maalymat['wind']['speed'];
      final temp = WeatherUtil.kelvinToCelcius(kelvin);
      _temp = temp;
      _icon = WeatherUtil.getWeatherIcon(kelvin);

      setState(() {});
      return maalymat;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future getWeatherByCityName(String _TypeCityName) async {
    try {
      final http = Client();
      Uri uri = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=${_TypeCityName}&appid=4ff04e40a38fde16e99e9f0911394214');
      var response = await http.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);
        final kelvin = jsonData['main']['temp'];
        _humidity = jsonData['main']['humidity'];
        _pressure = jsonData['main']['pressure'];
        _wind = jsonData['wind']['speed'];
        _cityName = jsonData['name'];
        final temp = WeatherUtil.kelvinToCelcius(kelvin);
      _temp = temp;
_icon = WeatherUtil.getWeatherIcon(kelvin);
        setState(() {
          

        });
      }
    } catch (error) {
      setState(() {
        
      });
      throw Exception(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Icon(
            Icons.location_on_outlined,
            size: 60,
            color: Colors.white,
          ),
          SizedBox(
            width: 360,
          ),
          InkWell(
            onTap: () async {
              final _typeUserSearch = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()));
              await getWeatherByCityName(_typeUserSearch);
              setState(() {});
            },
            child: Icon(
              Icons.location_city,
              size: 60,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: StackWidget(
          temp: _temp,
          wind: _wind,
          humidity: _humidity,
          pressure: _pressure,
          cityName: _cityName,
          icons: _icon,
          ),
    );
  }
}
