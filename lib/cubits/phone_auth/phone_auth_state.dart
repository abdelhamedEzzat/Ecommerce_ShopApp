part of 'phone_auth_cubit.dart';

sealed class PhoneAuthState extends Equatable {
  const PhoneAuthState();

  @override
  List<Object> get props => [];
}

final class PhoneAuthInitial extends PhoneAuthState {}

final class PhoneAuthLoading extends PhoneAuthState {}

final class ErrorOccurred extends PhoneAuthState {
  final String errorMsg;

  const ErrorOccurred({required this.errorMsg});
}

final class PhoneNumberSubmited extends PhoneAuthState {}

final class PhoneOTPVerified extends PhoneAuthState {}
