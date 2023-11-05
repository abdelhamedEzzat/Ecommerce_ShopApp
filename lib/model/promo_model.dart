import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../config/images_manger.dart';

class PromoModel extends Equatable {
  final String title;
  final String subTiltle;
  final String bottomTitle;
  final Image adImage;
  const PromoModel({
    required this.title,
    required this.subTiltle,
    required this.bottomTitle,
    required this.adImage,
  });

  @override
  List<Object?> get props => [title, subTiltle, bottomTitle, adImage];

  static List<PromoModel> promos = [
    PromoModel(
      title: 'Apple Store',
      subTiltle: 'Find the Apple product and accessories you’re looking for',
      bottomTitle: "Shop new Year",
      adImage: Image.asset(
        AssetsImages.appStoreImage,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    ),
    PromoModel(
      title: 'Apple Store',
      subTiltle: 'Find the Apple product and accessories you’re looking for',
      bottomTitle: "Shop new Year",
      adImage: Image.network(
        "https://static.thenounproject.com/png/654619-200.png",
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    ),
    PromoModel(
      title: 'Apple Store',
      subTiltle: 'Find the Apple product and accessories you’re looking for',
      bottomTitle: "Shop new Year",
      adImage: Image.network(
        "https://cdn.freebiesupply.com/logos/thumbs/2x/apple-logo.png",
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    ),
  ];
}
