import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'text_field_state.dart';

class TextFieldCubit extends Cubit<TextFieldState> {
  TextFieldCubit() : super(TextFieldInitial());

  final TextEditingController nameContraller = TextEditingController();
  final TextEditingController ageContraller = TextEditingController();
  final TextEditingController emailContraller = TextEditingController();

  getname(enterdName) {
    nameContraller.text = enterdName;
    emit(TextFieldChangedName(name: nameContraller.text));
  }

  getAge(enterdName) {
    ageContraller.text = enterdName;
    emit(TextFieldChangedAge(age: ageContraller.text));
  }

  getEmail(enterdName) {
    emailContraller.text = enterdName;
    emit(TextFieldChangedEmail(email: emailContraller.text));
  }
}
