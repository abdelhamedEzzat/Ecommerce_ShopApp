part of 'stripe_payment_getway_cubit.dart';

sealed class StripePaymentGetwayState extends Equatable {
  const StripePaymentGetwayState();

  @override
  List<Object> get props => [];
}

final class StripePaymentGetwayInitial extends StripePaymentGetwayState {}

final class PaymentCashOnDelivery extends StripePaymentGetwayState {
  final int value;

  const PaymentCashOnDelivery({required this.value});
  @override
  List<Object> get props => [value];
}

final class PaymentWithCreadetOrDebit extends StripePaymentGetwayState {
  final int value;

  const PaymentWithCreadetOrDebit({required this.value});
  @override
  List<Object> get props => [value];
}

final class PaymentWithCreadetOrDebitSucsses extends StripePaymentGetwayState {
  final String clientSecret;

  const PaymentWithCreadetOrDebitSucsses({required this.clientSecret});
  @override
  List<Object> get props => [clientSecret];
}

final class PaymentWithCreadetOrDebitFaild extends StripePaymentGetwayState {
  final String error;

  const PaymentWithCreadetOrDebitFaild({required this.error});
  @override
  List<Object> get props => [error];
}
