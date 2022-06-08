import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData}); //{} used because it must be inputted by named argument
  final dynamic parseWeatherData;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? cityName;
  int? temperature;

  @override
  void initState() {
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    double temperatureDouble = weatherData['main']['temp'];
    // temperature = temperatureDouble.toInt(); //toInt() 하는 방법 1 : 소수점 이하를 버림
    temperature = temperatureDouble.round(); //round() 하는 방법 2 : 소수점을 반올림함
    cityName = weatherData['name'];
    print(temperature);
    print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // title: const Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0.0, // move transparent appbar to the top (not body)
        leading: IconButton(
          icon: Icon(Icons.near_me),
          onPressed: () {},
          iconSize: 30.0,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_searching),
            onPressed: () {},
            iconSize: 30.0,
          )
        ],
      ),
      body: Container(
        child: Stack( //Stack means piling over layers, and therefore contains multiple items like children
          children: [
            Image.asset('image/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 150.0,
                  ),
                  Text(
                    'Seoul',
                    style: GoogleFonts.lato(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
