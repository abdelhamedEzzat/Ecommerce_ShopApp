import 'package:ecommerce_shop_app/model/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  double finalProduct = 0;
  List<ProductInfoModel> prouduct = ProductInfoModel.products;
  int index = 0;
  String product = '';

  //
  //  This Function For Increment counter in CounterWidget
  // in Product details Screen
  //
  void increment() {
    int count = prouduct[index].count++;

    emit(CounterIncrementLoaded(count));
  }

  //
  //  This Function For Decrement counter in CounterWidget
  // in Product details Screen
  //
  decrement() {
    if (prouduct[index].count == 1) {
      return prouduct[index].count = 1;
    } else {
      int counts = prouduct[index].count--;
      emit(CounterDecrementLoaded(counts));
    }
  }

  //
  //  This Function For increment Price in CounterWidget
  //  globel variable i used to see changed in ui (product)  in Product details Screen
  //

  priceIncrement() {
    double price = double.tryParse(prouduct[index].price) ?? 0.0;
    product = (price * prouduct[index].count).toString();

    emit(CounterincrementPrice(product));
  }

  //
  //  This Function For decrement Price in CounterWidget
  // globel variable i used to see changed in ui (product)  in Product details Screen
  //

  priceDecrement() {
    double price = double.tryParse(prouduct[index].price) ?? 0.0;

    product = (double.parse(product) - price).toString();

    emit(CounterdecrementPrice(product));
  }
}
