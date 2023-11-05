// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../model/models.dart';

abstract class AppState {}

class AppInitialState extends AppState {}

class AppCreateDataBaseSuccessfullyState extends AppState {}

class AppCreateDataBaseFailedState extends AppState {}

class AppGetDataBaseState extends AppState {
  final List<ProductInfoModel> products;

  AppGetDataBaseState(this.products);
}

class AppInsertDataBaseSuccessfollyState extends AppState {}

class AppIncrementState extends AppState {}

class AppDecrementState extends AppState {}

class AppChangePriceIncrement extends AppState {
  ProductInfoModel products;
  AppChangePriceIncrement({
    required this.products,
  });
}

class AppChangePricedecrement extends AppState {
  ProductInfoModel products;
  AppChangePricedecrement({
    required this.products,
  });
}

class IsHearted extends AppState {}
