import 'package:flutter/material.dart';
import 'package:flutter_weather_app/data/my_location.dart';
import 'package:flutter_weather_app/data/network.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '733d955aefd05a030b7a190495f8c99b';

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
  }

  void getLocation() async{
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitudePosition2 = myLocation.latitudePosition;
    longitudePosition2 = myLocation.longitudePosition;
    print(latitudePosition2);
    print(longitudePosition2);

    Network network = Network('https://api.openweathermap.org/data/2.5/weather?'
        'lat=$latitudePosition2&lon=$longitudePosition2&appid=$apiKey');
    var weatherData = await network.getJsonData(); //add await keyword as getJsonData()'s return type is Future<dynamic>
    print(weatherData);
  }

  // void fetchData() async{
  //
  //     //jsonDecode() return type is dynamic.. so use var for variable type
  //     var myJson = parsingData['weather'][0]['description'];
  //     print(myJson);
  //
  //     var windSpeed = parsingData['wind']['speed'];
  //     print(windSpeed);
  //
  //     var id = parsingData['id'];
  //     print(id);
  //   }else {
  //     print(response.statusCode);
  //   }
  // }

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
