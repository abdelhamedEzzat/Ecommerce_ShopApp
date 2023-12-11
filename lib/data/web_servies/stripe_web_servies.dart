import 'package:dio/dio.dart';
import 'package:ecommerce_shop_app/data/repo/stripe_repo.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeWebServies {
  static Future<String> getClientSecret(String amount, String currency) async {
    Dio dio = Dio();
    var response = await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(validateStatus: (status) => true, headers: {
        'Authorization': 'Bearer ${ApiKeysForStripe.secretKey}',
        'Content-Type': 'application/x-www-form-urlencoded'
      }),
      data: {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      },
    );
    return response.data["client_secret"].toString();
  }

  static Future<void> initpaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: "SAIED"),
    );
  }
}
