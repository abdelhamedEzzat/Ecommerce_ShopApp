part of 'google_sign_in_cubit.dart';

sealed class GoogleSignInState extends Equatable {
  const GoogleSignInState();

  @override
  List<Object> get props => [];
}

final class GoogleSignInInitial extends GoogleSignInState {}

final class GoogleSignLoading extends GoogleSignInState {}

final class GoogleSignLoaded extends GoogleSignInState {
  final User user;

  const GoogleSignLoaded(this.user);
}

final class GoogleSignFaild extends GoogleSignInState {
  final String error;
  const GoogleSignFaild(this.error);
}
