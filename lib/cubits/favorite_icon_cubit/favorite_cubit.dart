import 'package:ecommerce_shop_app/model/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  List<ProductInfoModel> prouduct = ProductInfoModel.products;
  List<ProductInfoModel> favoriteProducts = [];
  void addfavoriteItems(ProductInfoModel productInfoModel) {
    int indexOfProduct = prouduct.indexOf(productInfoModel);
    if (prouduct[indexOfProduct].favorite == false) {
      prouduct[indexOfProduct].favorite = true;
      favoriteProducts.add(productInfoModel);
    }

    emit(AddFavoriteLoaded(productInfoModel));
  }

  void removefavoriteItems(ProductInfoModel productInfoModel) {
    int indexOfProduct = prouduct.indexOf(productInfoModel);
    if (prouduct[indexOfProduct].favorite == true) {
      prouduct[indexOfProduct].favorite = false;
      favoriteProducts.remove(productInfoModel);
    }
    emit(RemoveFavoriteLoaded(productInfoModel));
  }
}
