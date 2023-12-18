import 'package:dio/dio.dart';

class PlacesWebServises {
  late Dio dio;
  String baseUrl =
      "https://maps.googleapis.com/maps/api/place/autocomplete/json";
  String locationDetails =
      "https://maps.googleapis.com/maps/api/place/details/json";
  PlacesWebServises() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(milliseconds: 20000),
      receiveTimeout: const Duration(milliseconds: 20000),
      receiveDataWhenStatusError: true,
    );

    dio = Dio(options);
  }
  Future<List<dynamic>> getPlacesSuggestation(
      String place, String sessionToken) async {
    try {
      Response response = await dio.get(baseUrl, queryParameters: {
        'input': place,
        'types': 'address',
        'components': 'country:eg',
        'key': 'AIzaSyB5wgPohO9jbcNfxLPHu4__xc3m28jQdAI',
        'sessiontoken': sessionToken,
      });
      return response.data['predictions'];
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<dynamic> getPlacesLocation(String placeId, String sessionToken) async {
    try {
      Response response = await dio.get(locationDetails, queryParameters: {
        'place_id': placeId,
        'fields': 'geometry',
        'key': 'AIzaSyB5wgPohO9jbcNfxLPHu4__xc3m28jQdAI',
        'sessiontoken': sessionToken,
      });
      return response.data;
    } catch (error) {
      print(error.toString());
      return Future.error("place Location Error : ",
          StackTrace.fromString("this is its trace"));
    }
  }
}
