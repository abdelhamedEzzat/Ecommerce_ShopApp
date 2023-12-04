import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop_app/model/product_model.dart';
import 'package:equatable/equatable.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  List<ProductInfoModel> prouduct = ProductInfoModel.products;
  Set<ProductInfoModel> favoriteProducts = {};

  void favoriteItemsTrue(ProductInfoModel productInfoModel) {
    int indexOfProduct = prouduct.indexOf(productInfoModel);
    if (prouduct[indexOfProduct].favorite == false) {
      prouduct[indexOfProduct].favorite = true;
      favoriteProducts.add(productInfoModel);

      // All(prouduct
      //     .where(
      //       (element) => element.favorite == true,
      //     )
      //     .toList()
      //     .toSet());
    } else {}

    emit(FavoriteLoaded(productInfoModel));
  }

  void favoriteItemsFalse(ProductInfoModel productInfoModel) {
    int indexOfProduct = prouduct.indexOf(productInfoModel);
    if (prouduct[indexOfProduct].favorite == true) {
      prouduct[indexOfProduct].favorite = false;
      // favoriteProducts.removeWhere((element) => element.favorite == false);
      favoriteProducts.removeWhere((element) => element.favorite == false);
    }
    emit(FavoriteLoaded2(productInfoModel));
  }
}
