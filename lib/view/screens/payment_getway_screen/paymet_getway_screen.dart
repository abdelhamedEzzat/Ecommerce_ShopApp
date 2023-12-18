import 'package:ecommerce_shop_app/controller/cubits/stripe_payment_getway/stripe_payment_getway_cubit.dart';
import 'package:ecommerce_shop_app/view/widgets/build_Payment_button_widget.dart';
import 'package:ecommerce_shop_app/view/widgets/cash_on_delivery.dart';
import 'package:ecommerce_shop_app/view/widgets/coustom_appbar.dart';
import 'package:ecommerce_shop_app/view/widgets/pay_with_creadit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentGetwayScreen extends StatelessWidget {
  // final ProductInfoModel productInfoModel;
  static const String routeName = "PaymentGetwayScreen";
  static Route route(
      //  ProductInfoModel productInfoModel,
      ) {
    return MaterialPageRoute(
      builder: (_) => const PaymentGetwayScreen(
          //  productInfoModel: productInfoModel,
          ),
      settings: const RouteSettings(name: routeName),
    );
  }

  const PaymentGetwayScreen({
    super.key,
    // required this.productInfoModel
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Text("Payment")),
      body: BlocBuilder<StripePaymentGetwayCubit, StripePaymentGetwayState>(
        builder: (context, state) {
          return const Column(children: [
            //
            CashOnDilevery(),
            //
            SizedBox(
              height: 20,
            ),
            //
            PayWithCredit(
                // productInfoModel: productInfoModel
                ),
            //
            SizedBox(
              height: 20,
            ),
            //
            PaymentButton()
          ]);
        },
      ),
    );
  }
}
