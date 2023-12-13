// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_shop_app/model/product_model.dart';

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

    emit(AddProductToCardLoaded(selectedProducts));
  }

  deleteItemInBag(ProductInfoModel productInfoModel) {
    if (selectedProducts.contains(productInfoModel)) {
      selectedProducts.remove(productInfoModel);

      emit(DeleteProductFromCardLoaded(selectedProducts));
    }
  }

  finance(ProductInfoModel productInfoModel) {
    try {
      subTotal = selectedProducts.fold(
        initial,
        (previousValue, element) {
          double productPrice = double.tryParse(element.priceProduct) ??
              double.parse(productInfoModel.price);
          return previousValue + productPrice;
        },
      );

      emit(Finance(subTotal));
    } catch (e) {
      print("Error calculating finance: $e");
      emit(Error("error in  finance ${e.toString()}"));
    }
  }

  financeDeliveryFee() {
    if (selectedProducts.length == 1) {
      deliveryFee = 5;
    } else if (selectedProducts.length > 1) {
      deliveryFee = 10;
    }

    emit(Finance(subTotal));
  }

  totalFinance(ProductInfoModel productInfoModel) {
    productInfoModel.total = subTotal + deliveryFee;
    productInfoModel.total =
        productInfoModel.total - (0.25 * productInfoModel.total);
    total = productInfoModel.total;
    emit(Finance(total));
  }

  bagNumber() {
    if (selectedProducts.isEmpty) {
      return null;
    } else if (selectedProducts.isNotEmpty) {
      return selectedProducts.length;
    }
  }
}




// favoriteProducts.addAll(prouduct
//           .where(
//             (element) => element.id == indexOfProduct,
//           )
//           .toList()
//           .toSet());