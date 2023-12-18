import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop_app/models/model/category_model.dart';
import 'package:ecommerce_shop_app/models/model/product_model.dart';
import 'package:ecommerce_shop_app/view/screens/categories_screens/all_categories.dart';
import 'package:ecommerce_shop_app/view/screens/categories_screens/computer_category.dart';
import 'package:ecommerce_shop_app/view/screens/categories_screens/headsets.dart';
import 'package:ecommerce_shop_app/view/screens/categories_screens/speakers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryLoading());

  categoryNav(
    CategoryModel category,
    context,
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
