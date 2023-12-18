import 'package:ecommerce_shop_app/controller/cubits/stripe_payment_getway/stripe_payment_getway_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final paymentGetWayCubit =
        BlocProvider.of<StripePaymentGetwayCubit>(context);
    return BlocBuilder<StripePaymentGetwayCubit, StripePaymentGetwayState>(
      builder: (context, state) {
        return Flexible(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              if (paymentGetWayCubit.selectPayment == false) {
                return;
              } else if (paymentGetWayCubit.selectPayment == true) {}
            },
            child: paymentGetWayCubit.selectPayment == false
                ? buildWhenUnSelectedButton(context)
                : buildWhenSelectedButton(context),
          ),
        );
      },
    );
  }

  Widget buildWhenUnSelectedButton(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        width: MediaQuery.of(context).size.width,
        child: const Text(
          "Continue",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ));
  }

  Widget buildWhenSelectedButton(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        width: MediaQuery.of(context).size.width,
        child: const Text(
          "Continue",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ));
  }
}
