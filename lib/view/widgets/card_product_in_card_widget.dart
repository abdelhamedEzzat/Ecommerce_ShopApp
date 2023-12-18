import 'package:ecommerce_shop_app/controller/cubits/counter_cubit/counter_cubit.dart';
import 'package:ecommerce_shop_app/models/model/product_model.dart';
import 'package:ecommerce_shop_app/view/widgets/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardProductInCardScreenWidget extends StatelessWidget {
  final ProductInfoModel productInfoModel;
  const CardProductInCardScreenWidget({
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
