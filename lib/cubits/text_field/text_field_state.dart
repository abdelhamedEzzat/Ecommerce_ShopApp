part of 'text_field_cubit.dart';

sealed class TextFieldState extends Equatable {
  const TextFieldState();

  @override
  List<Object> get props => [];
}

final class TextFieldInitial extends TextFieldState {}

final class TextFieldChangedName extends TextFieldState {
  final String name;

  const TextFieldChangedName({required this.name});
  @override
  List<Object> get props => [name];
}

final class TextFieldChangedAge extends TextFieldState {
  final String age;

  const TextFieldChangedAge({required this.age});
  @override
  List<Object> get props => [age];
}

final class TextFieldChangedEmail extends TextFieldState {
  final String email;

  const TextFieldChangedEmail({required this.email});
  @override
  List<Object> get props => [email];
}
