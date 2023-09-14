import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:alarm_clock/model/model.dart';


class WeatherClient{
  Future<WeatherModel> request() async {
    String url = "https://api.open-meteo.com/v1/forecast?latitude=21.028511&longitude=105.804817&current_weather=true&hourly=temperature_2m,relativehumidity_2m,windspeed_10m";
    Response response = await Dio().get(url);
    final parseData = jsonDecode(response.toString());
    final weather = WeatherModel.fromJson(parseData);
    return weather;
  }
}