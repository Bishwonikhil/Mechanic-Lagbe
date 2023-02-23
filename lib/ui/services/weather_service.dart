import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:third_year_project/ui/services/weather.dart';

class WeatherService{
  Future<Weather> getWeatherData(String place) async{
    //6e7c8f20520f47c691b44859232102

   try{
     final queryParameters = {
       'key': '6e7c8f20520f47c691b44859232102',
       'q': place,
     };
     final uri = Uri.http('api.weatherapi.com', '/v1/current.json', queryParameters);
     final response = await http.get(uri);
     if(response.statusCode == 200) {
       return Weather.fromJson(jsonDecode(response.body));
     }else{
       throw Exception("Cannot get weather");
     }
   }catch(e){
     rethrow;
   }

    }

}