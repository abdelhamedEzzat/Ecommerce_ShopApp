// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecommerce_shop_app/cubits/counter_cubit/counter_cubit.dart';
import 'package:ecommerce_shop_app/widgets/Bag_icon_in_appbar_widget.dart';
import 'package:ecommerce_shop_app/widgets/counter_widget.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_shop_app/model/product_model.dart';
import 'package:ecommerce_shop_app/widgets/coustom_appbar.dart';
import 'package:ecommerce_shop_app/widgets/finance_details_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCard extends StatelessWidget {
  static const String routeName = "My Card";
  static Route route(ProductInfoModel productInfoModel) {
    return MaterialPageRoute(
      builder: (_) => MyCard(productInfoModel: productInfoModel),
      settings: const RouteSettings(name: routeName),
    );
  }

  final ProductInfoModel productInfoModel;
  const MyCard({
    Key? key,
    required this.productInfoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          icon: BagIconChangedWithNumberOfProduct(
            productInfoModel: productInfoModel,
          ),
          title: const Text("MyCard"),
        ),
        body: BlocConsumer<CounterCubit, CounterState>(
          listener: (context, state) {
            if (state is CounterIncrementLoaded ||
                state is CounterDecrementLoaded) {
              BlocProvider.of<CounterCubit>(context).finance(productInfoModel);
              BlocProvider.of<CounterCubit>(context).financeDeliveryFee();
              BlocProvider.of<CounterCubit>(context)
                  .totalFinance(productInfoModel);
            }
          },
          builder: (context, state) {
            if (state is CounterInitial ||
                BlocProvider.of<CounterCubit>(context)
                    .selectedProducts
                    .isEmpty) {
              return SizedBox(
                height: MediaQuery.of(context).size.height / 1.2,
                width: MediaQuery.of(context).size.width,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      IconData(0xe811, fontFamily: 'MaterialIcons'),
                      // You can use any appropriate icon
                      size: 80.0,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "You don't have any products currently",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: BlocProvider.of<CounterCubit>(context)
                            .selectedProducts
                            .length,
                        itemBuilder: (context, index) => CardProductWidget(
                            productInfoModel: productInfoModel),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: FinanceDetailsWidget(
                          productInfoModel: productInfoModel),
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}

class CardProductWidget extends StatelessWidget {
  final ProductInfoModel productInfoModel;
  const CardProductWidget({
    Key? key,
    required this.productInfoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Image.asset(
                    productInfoModel.prodectImage,
                  ),
                ),
                Expanded(
                  child: ListTile(
                    iconColor: Colors.black,
                    contentPadding: const EdgeInsets.only(top: 20),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(productInfoModel.title,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface)),
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<CounterCubit>(context)
                                  .deleteItemInBag(productInfoModel);
                              print(BlocProvider.of<CounterCubit>(context)
                                  .selectedProducts
                                  .length);
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(productInfoModel.subTitle,
                            style: Theme.of(context).textTheme.bodyLarge),

                        //todo this row will be PriceAndCount widget

                        Row(
                          children: [
                            Text("\$",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface)),
                            Text(
                                productInfoModel.count == 1
                                    ? productInfoModel.priceProduct =
                                        productInfoModel.price
                                    : productInfoModel.priceProduct,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface)),
                            const Spacer(),
                            CounterWidget(
                              productInfoModel: productInfoModel,
                            ),
                          ],
                        )
                      ],
                    ),
                    isThreeLine: true,
                  ),
                )
              ],
            ),
            const Divider(
              color: Colors.black54,
            ),
          ],
        );
      },
    );
  }
}
