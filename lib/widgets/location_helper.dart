// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class LocationHelper {
//   static Future<Position> determinePosition() async {
//     return await Geolocator.getCurrentPosition();
//   }

//   static Future<List<Placemark>> getPlacemarks(Position? position) async {
//     if (position == null) {
//       return [];
//     }

//     return await placemarkFromCoordinates(position.latitude, position.longitude,
//         localeIdentifier: "en_US");
//   }

//   static String formatAddress(List<Placemark> placemarks) {
//     return "${placemarks.reversed.last.street ?? ""} , "
//         "${placemarks.reversed.last.thoroughfare ?? ""} , "
//         "${placemarks.reversed.last.subLocality ?? ""}, "
//         "${placemarks.reversed.last.locality ?? ""}, "
//         "${placemarks.reversed.last.administrativeArea ?? ""} , "
//         "${placemarks.reversed.last.country ?? ""}";
//   }

//   static CameraPosition getCameraPosition(Position? position) {
//     return CameraPosition(
//       target: LatLng(position?.latitude ?? 0.0, position?.longitude ?? 0.0),
//       tilt: 0.0,
//       zoom: 17,
//       bearing: 0.0,
//     );
//   }
// }
