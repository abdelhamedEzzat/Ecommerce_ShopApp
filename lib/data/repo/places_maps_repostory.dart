import 'package:ecommerce_shop_app/data/web_servies/google_web_servises.dart';
import 'package:ecommerce_shop_app/model/place_autocomplete_model.dart';
import 'package:ecommerce_shop_app/model/place_details_model.dart';

class MapsRepo {
  final PlacesWebServises placesWebServises;

  MapsRepo({required this.placesWebServises});

  Future<List<PlaceAutocomplete>> getPlacesSuggestation(
      String place, String sessionToken) async {
    final suggestaions =
        await placesWebServises.getPlacesSuggestation(place, sessionToken);

    return suggestaions
        .map((suggestion) => PlaceAutocomplete.fromJson(suggestion))
        .toList();
  }

  Future<PlaceDetails> getPlacesLocation(
    String placeId,
    String sessionToken,
  ) async {
    try {
      final place =
          await placesWebServises.getPlacesLocation(placeId, sessionToken);

      return PlaceDetails.fromJson(place);
    } catch (e) {
      // Handle the exception as per your requirement
      print("Error fetching place details: $e");
      // You can throw the exception again or return a default value
      throw e; // Throw the exception again to propagate it
      // return PlaceDetails(); // Return a default value if needed
    }
  }
}
