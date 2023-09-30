// ignore_for_file: public_member_api_docs, sort_constructors_first

// model from first slider in home view
import 'package:flutter/material.dart';

class AdvertisementModel {
  String title;
  String subTiltle;
  String bottomTitle;
  Image adImage;
  AdvertisementModel({
    required this.title,
    required this.subTiltle,
    required this.bottomTitle,
    required this.adImage,
  });
}

// this for Categories in home page

class CategoryModel {
  String categoryName;
  String iconImage;
  Function() onTap;
  CategoryModel({
    required this.categoryName,
    required this.iconImage,
    required this.onTap,
  });
}

// this for ProductInfo

class ProductInfoModel {
  String title;
  String subTitle;
  String price;
  String addIcon;
  Color colorProdectImage;
  String prodectImage;
  void Function()? onTap;
  ProductInfoModel({
    required this.title,
    required this.subTitle,
    required this.price,
    required this.addIcon,
    required this.colorProdectImage,
    required this.prodectImage,
    this.onTap,
  });
}
