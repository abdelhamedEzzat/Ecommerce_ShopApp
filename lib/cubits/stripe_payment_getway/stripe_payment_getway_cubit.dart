import 'package:dio/dio.dart';
import 'package:ecommerce_shop_app/data/repo/stripe_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

part 'stripe_payment_getway_state.dart';

class StripePaymentGetwayCubit extends Cubit<StripePaymentGetwayState> {
  StripePaymentGetwayCubit() : super(StripePaymentGetwayInitial());

  int radioSelected = 0;
  bool isPaymentCreadit = false;
  bool selectPayment = false;

  paymentWithCash(int value) {
    selectPayment = true;
    isPaymentCreadit = false;
    radioSelected = value;

    emit(PaymentCashOnDelivery(value: radioSelected));
  }

  paymentWithCredit(int value) {
    isPaymentCreadit = true;
    selectPayment = true;
    radioSelected = value;

    emit(PaymentWithCreadetOrDebit(value: radioSelected));
  }

  // Future<void> makepayment(double amount, String currency) async {
  //   try {
  //     String clientSecret = await StripeWebServies.getClientSecret(
  //         (amount * 100).toString(), currency);

  //     await StripeWebServies.initpaymentSheet(clientSecret);

  //     await Stripe.instance.presentPaymentSheet();
  //     emit(PaymentWithCreadetOrDebitSucsses(clientSecret: clientSecret));
  //   } catch (e) {
  //     emit(PaymentWithCreadetOrDebitFaild(error: e.toString()));
  //   }
  // }
  Future<void> makePayment(int amount, String currency) async {
    try {
      String clientSecret =
          await _getClientSecret((amount * 100).toString(), currency);
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
      emit(PaymentWithCreadetOrDebitSucsses(clientSecret: clientSecret));
    } catch (error) {
      emit(PaymentWithCreadetOrDebitSucsses(clientSecret: error.toString()));
    }
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "Basel",
      ),
    );
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    Dio dio = Dio();
    var response = await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${ApiKeysForStripe.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      ),
      data: {
        'amount': amount,
        'currency': currency,
      },
    );
    return response.data["client_secret"];
  }
}
