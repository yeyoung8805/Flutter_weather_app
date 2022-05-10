import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  //stful 입력하고 자동완성 나오면 엔터
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
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
