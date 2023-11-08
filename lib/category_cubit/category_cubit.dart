import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop_app/model/product_model.dart';
import 'package:ecommerce_shop_app/screens/categories/all_categories.dart';
import 'package:ecommerce_shop_app/screens/categories/computer_category.dart';
import 'package:ecommerce_shop_app/screens/categories/headsets.dart';
import 'package:ecommerce_shop_app/screens/categories/speakers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryLoading());

  categoryNav(
    CategoryModel category,
    context,
    index,
  ) {
    emit(CategoryLoading());

    if (CategoryModel.categories.elementAt(0) == category) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const AllCategories(),
      ));

      emit(CategoryLoaded());

      //
    } else if (CategoryModel.categories.elementAt(1) == category) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ComputersCategoryScreen(),
      ));
      emit(CategoryLoaded());

      //
    } else if (CategoryModel.categories.elementAt(2) == category) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HeadsetsCategoryScreen(),
      ));
      emit(CategoryLoaded());

      //
    } else if (CategoryModel.categories.elementAt(3) == category) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const SpeakersCategoryScreen(),
      ));
      emit(CategoryLoaded());
    }
  }
}
