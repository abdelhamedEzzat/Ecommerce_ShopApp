// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../persentation _ layer/model/models.dart';

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
