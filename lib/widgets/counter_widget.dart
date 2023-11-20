import 'package:ecommerce_shop_app/cubits/counter_cubit/counter_cubit.dart';
import 'package:ecommerce_shop_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounterWidget extends StatelessWidget {
  final ProductInfoModel productInfoModel;
  const CounterWidget({
    super.key,
    required this.productInfoModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return Row(
          children: [
            IconButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                  BlocProvider.of<CounterCubit>(context).priceDecrement();
                },
                icon: Icon(
                  Icons.do_not_disturb_on_outlined,
                  size: 25.spMin,
                )),
            Text("${productInfoModel.count}",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface)),
            IconButton(
                onPressed: () {
                  //
                  BlocProvider.of<CounterCubit>(context).increment();
                  BlocProvider.of<CounterCubit>(context).priceIncrement();
                  //  print();
                },
                icon: Icon(
                  Icons.add_circle_outline_outlined,
                  size: 25.spMin,
                ))
          ],
        );
      },
    );
  }
}





  // print(
                  //     'PROD SSSSSSSSSSSSSSSSSSSSS ${productInfoModel.price[0]}');
                  // BlocProvider.of<CounterCubit>(context)
                  //     .priceOfProduct(productInfoModel);

                  //  print(BlocProvider.of<CounterCubit>(context).count);