import 'package:flutter/material.dart';
import 'package:flutter_weather_app/data/my_location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  //stful 입력하고 자동완성 나오면 엔터
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  double? latitudePosition2; //double? for null-safety (null aware operator)
  double? longitudePosition2;

  @override
  void initState() {
    super.initState();
    getLocation();
    fetchData();
  }

  void getLocation() async{
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitudePosition2 = myLocation.latitudePosition;
    longitudePosition2 = myLocation.longitudePosition;
    print(latitudePosition2);
    print(longitudePosition2);
  }

  void fetchData() async{
    http.Response response = await http.get(Uri.parse('https://samples.openweathermap.org/data/2.5/weather?'
        'q=London&appid=b1b15e88fa797225412429c1c50c122a1'));
    if(response.statusCode == 200) {
      String jsonData = response.body;

      //jsonDecode() return type is dynamic.. so use var for variable type
      var myJson = jsonDecode(jsonData)['weather'][0]['description'];
      print(myJson);

      var windSpeed = jsonDecode(jsonData)['wind']['speed'];
      print(windSpeed);

      var id = jsonDecode(jsonData)['id'];
      print(id);
    }else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: null,
          child: const Text(
            'Get my location',
            style: TextStyle(color: Colors.white),
          ),
          // color: Colors.blue,
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.blue,
          ),
        ),
      ),
    );
  }
}
