import 'package:ecommerce_shop_app/controller/cubits/stripe_payment_getway/stripe_payment_getway_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CashOnDilevery extends StatelessWidget {
  const CashOnDilevery({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentGetWayCubit =
        BlocProvider.of<StripePaymentGetwayCubit>(context);
    return Flexible(
        flex: 1,
        // fit: FlexFit.tight,
        child: BlocBuilder<StripePaymentGetwayCubit, StripePaymentGetwayState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(8)),
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                title: const Text("Cash On Delivery"),
                leading: Radio(
                  value: 1,
                  groupValue: paymentGetWayCubit.radioSelected,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    paymentGetWayCubit.paymentWithCash(value!);
                  },
                ),
              ),
            );
          },
        ));
  }
}
