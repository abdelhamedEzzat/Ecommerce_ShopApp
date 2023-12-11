import 'package:ecommerce_shop_app/cubits/maps/search_bar_maps_state.dart';
import 'package:ecommerce_shop_app/cubits/maps/search_bar_maps_state.dart';
import 'package:ecommerce_shop_app/data/repo/places_maps_repostory.dart';
import 'package:ecommerce_shop_app/model/place_autocomplete_model.dart';
import 'package:ecommerce_shop_app/model/place_details_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBarMapsCubit extends Cubit<SearchBarMapsState> {
  final MapsRepo mapsRepo;
  SearchBarMapsCubit(this.mapsRepo) : super(MapsInitial());

  void emitPlaceSuggestation(String place, String sessionToken) {
    mapsRepo.getPlacesSuggestation(place, sessionToken).then((suggestations) {
      emit(MapsPlacesLoaded(places: suggestations));
    });
  }

  void emitPlaceLocation(String placeId, String sessionToken) {
    mapsRepo
        .getPlacesLocation(
      placeId,
      sessionToken,
    )
        .then((placeLocation) {
      emit(PlaceLoctionLoaded(placeDetails: placeLocation));
    });
  }
}
