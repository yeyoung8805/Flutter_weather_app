import 'package:geolocator/geolocator.dart';

class MyLocation {
  double? latitudePosition;
  double? longitudePosition;

  Future<void> getMyCurrentLocation() async{
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitudePosition = position.latitude;
      longitudePosition = position.longitude;
      print(latitudePosition);
      print(longitudePosition);
    }catch(e) {
      print("There was a problem with the internet connection.");
    }
  }
}