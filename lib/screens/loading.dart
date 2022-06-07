import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  //stful 입력하고 자동완성 나오면 엔터
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    super.initState();
    getLocation();
    fetchData();
  }

  void getLocation() async{
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
    }catch(e) {
      print("There was a problem with the internet connection.");
    }
  }

  void fetchData() async{
    Response response = await get(Uri.parse('https://samples.openweathermap.org/data/2.5/weather?'
        'q=London&appid=b1b15e88fa797225412429c1c50c122a1'));
    print(response.body);
    print(response.statusCode);
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
