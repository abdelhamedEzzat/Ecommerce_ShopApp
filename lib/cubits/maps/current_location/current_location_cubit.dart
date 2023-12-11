import 'dart:async';

import 'package:ecommerce_shop_app/data/repo/current_location_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'current_location_state.dart';

class CurrentLocationCubit extends Cubit<CurrentLocationState> {
  final CurrentLocationRepository currentLocationRepository;
  CurrentLocationCubit({required this.currentLocationRepository})
      : super(CurrentLocationInitial());

//
//
//

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static Position? position;
  static CameraPosition myCameraPosation = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      tilt: 0.0,
      zoom: 17,
      bearing: 0.0);

  List<Placemark> placemarks = [];
  String markerAddress = "";
  Set<Marker> markers = Set();

//
//
//

  Future<void> getMyCurrentLocation() async {
    emit(CurrentLocationLoading());
    position =
        await CurrentLocationRepository.determinePosition().whenComplete(() {
      //
    });
    placemarks = await placemarkFromCoordinates(
        position!.latitude, position!.longitude,
        localeIdentifier: "en_US");

    markerAddress =
        "${placemarks.reversed.last.street ?? ""} , ${placemarks.reversed.last.thoroughfare ?? ""} , ${placemarks.reversed.last.subLocality ?? ""},  ${placemarks.reversed.last.locality ?? ""}, ${placemarks.reversed.last.administrativeArea ?? ""} , ${placemarks.reversed.last.country ?? ""}";

    emit(CurrentLocationLoaded(position: position!));
  }

  Widget buildMap() {
    return GoogleMap(
      markers: markers,
      initialCameraPosition: myCameraPosation,
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  Future<void> goToMyCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(myCameraPosation));
  }
}
