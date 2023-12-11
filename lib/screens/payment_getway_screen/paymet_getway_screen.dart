import 'package:ecommerce_shop_app/config/images_manger.dart';
import 'package:ecommerce_shop_app/cubits/stripe_payment_getway/stripe_payment_getway_cubit.dart';
import 'package:ecommerce_shop_app/widgets/coustom_appbar.dart';
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
      appBar: CustomAppBar(title: Text("Payment")),
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
                return null;
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

class PayWithCredit extends StatelessWidget {
  //final ProductInfoModel productInfoModel;
  const PayWithCredit({
    super.key,
    // required this.productInfoModel
  });

  Widget build(BuildContext context) {
    final paymentGetWayCubit =
        BlocProvider.of<StripePaymentGetwayCubit>(context);
    return Flexible(
        flex: 3,
        child: BlocBuilder<StripePaymentGetwayCubit, StripePaymentGetwayState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(8)),
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                title: paymentGetWayCubit.isPaymentCreadit == false
                    ? const Text("Pay With Credit Or Debit Card")
                    : Column(mainAxisSize: MainAxisSize.min, children: [
                        const Text("Pay With Credit Or Debit Card"),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 25),
                              child: Image.asset(
                                AssetsImages.visa,
                                cacheHeight: 70,
                                width: 70,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Image.asset(
                              AssetsImages.mezaIcon,
                              cacheHeight: 50,
                              width: 40,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Image.asset(
                              AssetsImages.masterCard,
                              cacheHeight: 50,
                              width: 50,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                            ),
                            //
                            //
                            //
                            //
                            child: GestureDetector(
                              onTap: () async {
                                await BlocProvider.of<StripePaymentGetwayCubit>(
                                        context)
                                    .makePayment(20, "USD");

                                // 'productInfoModel.total',
                              },
                              child: Text(
                                "Add a Credit Or Debit Card",
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ))
                      ]),
                leading: Radio(
                  value: 2,
                  groupValue: paymentGetWayCubit.radioSelected,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    paymentGetWayCubit.paymentWithCredit(value!);
                  },
                ),
              ),
            );
          },
        ));
  }
}
