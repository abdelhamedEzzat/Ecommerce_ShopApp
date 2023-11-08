import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop_app/model/product_model.dart';
import 'package:equatable/equatable.dart';

part 'hot_sales_state.dart';

class HotSalesCubit extends Cubit<HotSalesState> {
  Set<ProductInfoModel> hotSales = {};
  List<ProductInfoModel> product = ProductInfoModel.products;

  HotSalesCubit() : super(HotSalesInitial());

  clicked(ProductInfoModel productModel) {
    final productInfoModel = List.of(product);
    for (int i = 0; i < productInfoModel.length; i++) {
      if (productInfoModel[i].id == productModel.id) {
        productInfoModel[i].clickCount++;

        if (productInfoModel[i].clickCount % 4 == 0) {
          hotSales.add(productInfoModel[i]);

          emit(HotSalesLoaded(hotSales: List.of(hotSales)));
        }

        break;
      }
    }
  }
}
