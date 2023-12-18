import 'package:ecommerce_shop_app/config/images_manger.dart';
import 'package:ecommerce_shop_app/controller/cubits/stripe_payment_getway/stripe_payment_getway_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayWithCredit extends StatelessWidget {
  //final ProductInfoModel productInfoModel;
  const PayWithCredit({
    super.key,
    // required this.productInfoModel
  });

  @override
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
                                    .makePayment(750, "USD");

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
