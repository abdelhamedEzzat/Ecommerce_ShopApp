import 'dart:async';

import 'package:geolocator/geolocator.dart';

class CurrentLocationRepository {
  // this function to get permation if user open GPS or Nor if
  // Not it will requestPermission it yes it will getCurrentPosition
  //
  //
  static Future<Position?> determinePosition() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.deniedForever) {
          // The user permanently denied location access
          return Future.error('Location Not Available');
        } else if (permission == LocationPermission.denied) {
          // The user denied location access
          return Future.error('Location Permission Denied');
        }
      }

      // If permission is granted or permanently granted, get the current position
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      print('Error determining location: $e');
      // Handle other exceptions if necessary
      return null; // or return an error object, depending on your use case
    }
  }
}
