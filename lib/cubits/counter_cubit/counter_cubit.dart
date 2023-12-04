import 'package:ecommerce_shop_app/model/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  List<ProductInfoModel> prouduct = ProductInfoModel.products;
  final result = 0;

  String pro = "";
  Set<ProductInfoModel> selectedProducts = {};
  Set<ProductInfoModel> favoriteProducts = {};
  double subTotal = 0;
  double initial = 0;
  double deliveryFee = 5;
  double discount = 25;
  double total = 0;
  String d = "";
  // bool favorite = false;

  //
  //  This Function For Increment counter in CounterWidget
  //  in Product details Screen
  //
  void increment(ProductInfoModel productInfoModel) {
    int indexOfProduct = prouduct.indexOf(productInfoModel);

    int count = prouduct[indexOfProduct].count++;

    emit(CounterIncrementLoaded(count));
  }

  //
  //  This Function For Decrement counter in CounterWidget
  //  in Product details Screen
  //

  decrement(ProductInfoModel productInfoModel) {
    int indexOfProduct = prouduct.indexOf(productInfoModel);
    if (prouduct[indexOfProduct].count == 1) {
      return prouduct[indexOfProduct].count = 1;
    } else {
      int counts = prouduct[indexOfProduct].count--;
      emit(CounterDecrementLoaded(counts));
    }
  }

  //
  //  This Function For increment Price in CounterWidget
  //  globel variable i used to see changed in ui (product)  in Product details Screen
  //

  priceIncrement(ProductInfoModel productInfoModel) {
    int indexOfProduct = prouduct.indexOf(productInfoModel);
    double price = double.tryParse(prouduct[indexOfProduct].price) ?? 0.0;

    productInfoModel.priceProduct =
        (price * prouduct[indexOfProduct].count).toString();

    emit(CounterincrementPrice(productInfoModel.priceProduct));
  }

  //
  //  This Function For decrement Price in CounterWidget
  //  globel variable i used to see changed in ui (product)  in Product details Screen
  //

  priceDecrement(ProductInfoModel productInfoModel) {
    int indexOfProduct = prouduct.indexOf(productInfoModel);
    double price = double.tryParse(prouduct[indexOfProduct].price) ?? 0.0;
    if (productInfoModel.count == 1) {
      productInfoModel.priceProduct = productInfoModel.price;
    } else {
      productInfoModel.priceProduct =
          (double.parse(productInfoModel.priceProduct) - price).toString();
    }

    emit(CounterdecrementPrice(productInfoModel.priceProduct));
  }

//
//
//
//
  addItemToBag(ProductInfoModel productInfoModel) {
    int indexOfProduct = prouduct.indexOf(productInfoModel);

    if (productInfoModel.id == indexOfProduct) {
      selectedProducts.addAll(prouduct
          .where(
            (element) => element.id == indexOfProduct,
          )
          .toList()
          .toSet());
    }

    emit(PriceList(selectedProducts));
  }

  finance() {
    subTotal = selectedProducts.fold(
      initial,
      (previousValue, element) =>
          previousValue + double.parse(element.priceProduct),
    );

    emit(Finance(subTotal));
  }

  financeDeliveryFee() {
    if (selectedProducts.length == 1) {
      deliveryFee = 5;
    } else if (selectedProducts.length > 1) {
      deliveryFee = 10;
    }

    emit(Finance(subTotal));
  }

  totalFinance() {
    total = subTotal + deliveryFee;
    total = total - (0.25 * total);
    emit(Finance(subTotal));
  }
}
// favoriteProducts.addAll(prouduct
//           .where(
//             (element) => element.id == indexOfProduct,
//           )
//           .toList()
//           .toSet());