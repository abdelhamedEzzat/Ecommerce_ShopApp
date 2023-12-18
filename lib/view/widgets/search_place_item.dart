// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ecommerce_shop_app/models/model/place_autocomplete_model.dart';

class SearchPlaceItem extends StatelessWidget {
  final PlaceAutocomplete placeAutocomplete;

  const SearchPlaceItem({
    Key? key,
    required this.placeAutocomplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var subTitle = placeAutocomplete.description
        .replaceAll(placeAutocomplete.description.split(",")[0], "");
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.all(8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Icon(
                Icons.place,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "${placeAutocomplete.description.split(",")[0]}\n",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: subTitle.substring(2),
                      style: const TextStyle(color: Colors.black, fontSize: 16))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
