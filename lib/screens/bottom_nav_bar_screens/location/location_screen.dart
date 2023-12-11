import 'dart:async';

import 'package:ecommerce_shop_app/cubits/maps/search_bar_maps_cubit.dart';
import 'package:ecommerce_shop_app/cubits/maps/search_bar_maps_state.dart';
import 'package:ecommerce_shop_app/data/repo/current_location_repo.dart';
import 'package:ecommerce_shop_app/model/place_autocomplete_model.dart';
import 'package:ecommerce_shop_app/model/place_details_model.dart';
import 'package:ecommerce_shop_app/widgets/search_place_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:uuid/uuid.dart';

class LocationScreen extends StatefulWidget {
  static const String routeName = "LocationScreen";
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LocationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    getMyCurrentLocation();
  }

  // to Get my current Location
  static Position? position;

  static CameraPosition myCameraPosation = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      tilt: 0.0,
      zoom: 17,
      bearing: 0.0);

  Future<void> getMyCurrentLocation() async {
    position =
        await CurrentLocationRepository.determinePosition().whenComplete(() {
      //

      setState(() {});
    });
    placemarks = await placemarkFromCoordinates(
            position!.latitude, position!.longitude,
            localeIdentifier: "en_US")
        .whenComplete(() {
      setState(() {
        _showLocationBottomSheetForCurrentAddress();
      });
    });
    setState(() {
      markerAddress =
          "${placemarks.reversed.last.street ?? ""} , ${placemarks.reversed.last.thoroughfare ?? ""} , ${placemarks.reversed.last.subLocality ?? ""},  ${placemarks.reversed.last.locality ?? ""}, ${placemarks.reversed.last.administrativeArea ?? ""} , ${placemarks.reversed.last.country ?? ""}";
    });
  }

  void _showLocationBottomSheetForCurrentAddress() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Your Address:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(markerAddress,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add your save logic here
                  print('Location saved!');
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: const Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Placemark> placemarks = [];
  Set<Marker> markers = {};
  String markerAddress = "";

  late PlaceAutocomplete placeAutocomplete;
  late PlaceDetails selectedPlace;
  late Marker searchedPlaceMarkers;
  late CameraPosition goToSearchedForPlace;
  void buildcameraNewPostion() {
    goToSearchedForPlace = CameraPosition(
      bearing: 0.0,
      tilt: 0.0,
      target: LatLng(selectedPlace.result.geometry.location.lat,
          selectedPlace.result.geometry.location.lng),
      zoom: 13,
    );
  }

  List<PlaceAutocomplete> places = [];

  final FloatingSearchBarController controller = FloatingSearchBarController();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Future<void> getInitialAdress() async {}

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
    controller
        .animateCamera(CameraUpdate.newCameraPosition(myCameraPosation))
        .whenComplete(() {
      setState(() {});
    });
  }

  Widget buildFloatingSearchBar() {
    final isportrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return FloatingSearchBar(
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildSuggestationBloc(),
              //3
              buildSelectedPlaceLocationBloc(),
            ],
          ),
        );
      },
      controller: controller,
      elevation: 6,
      hintStyle: const TextStyle(fontSize: 18),
      queryStyle: const TextStyle(fontSize: 18),
      hint: "Find a place..",
      border: const BorderSide(style: BorderStyle.none),
      margins: const EdgeInsets.fromLTRB(20, 70, 20, 0),
      padding: const EdgeInsets.fromLTRB(10, 0, 2, 0),
      height: 52,
      iconColor: Theme.of(context).colorScheme.primaryContainer,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 600),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isportrait ? 0.0 : -1,
      openAxisAlignment: 0.0,
      width: isportrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        getPlacesSuggestaion(query);
      },
      onFocusChanged: (_) {},
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: Icon(
              Icons.place,
              color: Colors.black.withOpacity(0.6),
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  getPlacesSuggestaion(String query) {
    final sessionToken = const Uuid().v4();
    BlocProvider.of<SearchBarMapsCubit>(context)
        .emitPlaceSuggestation(query, sessionToken);
  }

  Widget buildSuggestationBloc() {
    return BlocBuilder<SearchBarMapsCubit, SearchBarMapsState>(
        builder: (context, state) {
      if (state is MapsPlacesLoaded) {
        places = (state).places;
        if (places.length != 0) {
          return buildPlacesList();
        } else {
          return Container();
        }
      } else {
        return Container();
      }
    });
  }

  Widget buildPlacesList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {
            placeAutocomplete = places[index];
            getSelectedPlaceLocation();
            controller.close();
          },
          child: SearchPlaceItem(placeAutocomplete: places[index]),
        );
      },
      itemCount: places.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
    );
  }

  void getSelectedPlaceLocation() {
    final sessionToken = const Uuid().v4();
    BlocProvider.of<SearchBarMapsCubit>(context)
        .emitPlaceLocation(placeAutocomplete.placeid, sessionToken);
  }

  Widget buildSelectedPlaceLocationBloc() {
    return BlocListener<SearchBarMapsCubit, SearchBarMapsState>(
      listener: (context, state) {
        if (state is PlaceLoctionLoaded) {
          selectedPlace = state.placeDetails;
          goToMySearchedForLocation();
        }
      },
      child: Container(),
    );
  }

  Future<void> goToMySearchedForLocation() async {
    buildcameraNewPostion();
    final GoogleMapController controller = await _controller.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(goToSearchedForPlace))
        .whenComplete(() {});
    buildSearchPlaceMarker();

    placemarks = await placemarkFromCoordinates(
            selectedPlace.result.geometry.location.lat,
            selectedPlace.result.geometry.location.lng,
            localeIdentifier: "en_US")
        .whenComplete(() {
      setState(() {
        _showLocationBottomSheetForCurrentAddress();
      });
    });

    setState(() {
      markerAddress =
          "${placemarks.reversed.last.street ?? ""} , ${placemarks.reversed.last.thoroughfare ?? ""} , ${placemarks.reversed.last.subLocality ?? ""},  ${placemarks.reversed.last.locality ?? ""}, ${placemarks.reversed.last.administrativeArea ?? ""} , ${placemarks.reversed.last.country ?? ""}";
    });

    // print(changeAddress.first);
  }

  void buildSearchPlaceMarker() {
    setState(() {
      searchedPlaceMarkers = Marker(
          markerId: const MarkerId("2"),
          position: goToSearchedForPlace.target,
          infoWindow: InfoWindow(
            title: "${placeAutocomplete.description}",
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          onTap: () {});
    });

    addmarker(searchedPlaceMarkers);
  }

  void addmarker(Marker searchedPlaceMarkers) {
    markers.add(searchedPlaceMarkers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        position != null
            ? buildMap()
            : Center(
                child: Container(
                    child: const CircularProgressIndicator(
                  color: Colors.blue,
                )),
              ),
        buildFloatingSearchBar(),
      ]),
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 8, 30),
        child: FloatingActionButton(
            onPressed: goToMyCurrentLocation,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            child: const Icon(
              Icons.place,
              color: Colors.white,
            )),
      ),
    );
  }
}
