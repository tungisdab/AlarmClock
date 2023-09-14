import 'package:alarm_clock/model/model.dart';
import 'package:flutter/material.dart';

import '../client/client.dart';


class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  WeatherModel ? weatherModel;
  List<Widget>? Hourly_cast;
  List<Widget>? Hourly_cast_time;
  List<dynamic>? hourly_temp;
  List<dynamic>? hourly_date;
  String rowTime = "";
  formatHourlyCastTime(dynamic e){
    rowTime = e.toString();
    String date = rowTime.substring(8, 10) + "/" + rowTime.substring(5, 7) + "/" + rowTime.substring(0, 4);
    String timeHour = rowTime.substring(11, 13) + ":" + rowTime.substring(14, 16);
    String result = date + " " + timeHour;
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(  
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Hà Nội"),
              SizedBox(height: 20,),
              Icon(Icons.sunny, color: Colors.amber,size: 50,),
              SizedBox(height: 20,),
              Text(
                "${weatherModel?.currentWeather["temperature"] != null ? weatherModel?.currentWeather["temperature"]:0}C",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () async{
                  weatherModel = await WeatherClient().request();
                  hourly_temp = weatherModel?.hourly["temperature_2m"];
                  hourly_date = weatherModel?.hourly["time"];
                  Hourly_cast = hourly_temp?.map((e)=>
                    Padding(padding: EdgeInsets.all(8.0), child: Text("$e",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),)
                  ).toList();
                  Hourly_cast_time = hourly_date?.map((e)=>
                    Padding(
                      padding: EdgeInsets.all(8.0), 
                      child: Text(
                        formatHourlyCastTime(e),
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                      ),
                    )
                  ).toList();
                  
                  setState(() {
                    
                  });
                },
                child: Text('Get weather'),
              ),
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(255, 251, 251, 100),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: Hourly_cast_time == null ? [Text("Empty")]:Hourly_cast_time!,
                    ),
                    Column(
                      children: Hourly_cast == null ? [Text("Empty")]:Hourly_cast!,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}