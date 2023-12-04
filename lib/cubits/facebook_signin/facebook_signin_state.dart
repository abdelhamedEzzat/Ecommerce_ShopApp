part of 'facebook_signin_cubit.dart';

sealed class FacebookSigninState extends Equatable {
  const FacebookSigninState();

  @override
  List<Object> get props => [];
}

final class FacebookSigninInitial extends FacebookSigninState {}

final class FacebookSignLoading extends FacebookSigninState {}

final class FacebookSignLoaded extends FacebookSigninState {
  final User user;

  const FacebookSignLoaded(this.user);
  @override
  List<Object> get props => [user];
}

final class FacebookSignFaild extends FacebookSigninState {
  final String error;

  const FacebookSignFaild(this.error);
  @override
  List<Object> get props => [error];
}
