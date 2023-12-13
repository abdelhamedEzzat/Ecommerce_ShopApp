// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shop_app/config/images_manger.dart';
import 'package:ecommerce_shop_app/cubits/counter_cubit/counter_cubit.dart';
import 'package:ecommerce_shop_app/model/product_model.dart';
import 'package:ecommerce_shop_app/screens/my_card/my_card_screen.dart';

class BagIconChangedWithNumberOfProduct extends StatelessWidget {
  final ProductInfoModel? productInfoModel;
  const BagIconChangedWithNumberOfProduct({
    Key? key,
    this.productInfoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        if (state is CounterInitial ||
            BlocProvider.of<CounterCubit>(context).selectedProducts.isEmpty) {
          return SizedBox(
            width: 40.w,
            height: 55.h,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(MyCard.routeName, arguments: productInfoModel);
              },
              child: Image.asset(
                AssetsImages.bagIcons,
              ),
            ),
          );
        } else {
          return Stack(
            children: [
              Positioned(
                bottom: 20,
                right: 20,
                child: Container(
                  width: 25.w,
                  height: 18.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  child: Center(
                      child: Text(
                    "${BlocProvider.of<CounterCubit>(context).selectedProducts.length}",
                    style: const TextStyle(color: Colors.white),
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    MyCard.routeName,
                  );
                },
                child: SizedBox(
                  width: 40.w,
                  height: 55.h,
                  child: Image.asset(
                    AssetsImages.bagIcons,
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
