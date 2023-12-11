import 'package:ecommerce_shop_app/model/place_autocomplete_model.dart';
import 'package:ecommerce_shop_app/model/place_details_model.dart';
import 'package:equatable/equatable.dart';

sealed class SearchBarMapsState extends Equatable {
  const SearchBarMapsState();

  @override
  List<Object> get props => [];
}

final class MapsInitial extends SearchBarMapsState {}

final class MapsPlacesLoaded extends SearchBarMapsState {
  final List<PlaceAutocomplete> places;

  const MapsPlacesLoaded({required this.places});
  @override
  List<Object> get props => [places];
}

final class PlaceLoctionLoaded extends SearchBarMapsState {
  final PlaceDetails placeDetails;

  const PlaceLoctionLoaded({required this.placeDetails});
  @override
  List<Object> get props => [placeDetails];
}
