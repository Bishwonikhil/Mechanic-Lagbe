import 'package:flutter/material.dart';
import 'package:third_year_project/services/weather.dart';
import 'package:third_year_project/services/weather_services.dart';
//import 'package:third_year_project/ui/services/weather.dart';
 //import 'package:third_year_project/ui/services/weather_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherService weatherService = WeatherService();
  Weather weather = Weather();

  String currentWeather = "";
  double tempC = 0;
  double tempF = 0;


  @override
  void initState(){
    super.initState();
    getWeather();
  }

  void getWeather() async{
    weather = await weatherService.getWeatherData("Sylhet");

    setState(() {
      currentWeather = weather.condition;
      tempF = weather.temperatureF;
      tempC = weather.temperatureC;
    });

    print(weather.temperatureC);
    print(weather.temperatureF);
    print(weather.condition);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(currentWeather),
              Text(tempC.toString()),
              Text(tempF.toString()),
            ],
          ),
        ),
      ),
    );
  }
}