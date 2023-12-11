class PlaceAutocomplete {
  late String placeid;
  late String description;

  PlaceAutocomplete.fromJson(Map<String, dynamic> json) {
    placeid = json["place_id"];
    description = json["description"];
  }
}
