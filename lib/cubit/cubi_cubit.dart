import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/category_model.dart';

part 'cubi_state.dart';

class CubiCubit extends Cubit<CubiState> {
  CubiCubit() : super(CubiInitial());

  method(CategoryModel category) {
    emit(CubiLoading());
    if (CategoryModel.categories.elementAt(0) == category) {
      emit(CubiLoaded());
    }
  }
}
