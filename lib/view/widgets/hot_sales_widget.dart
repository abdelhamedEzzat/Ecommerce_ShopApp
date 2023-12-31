import 'dart:math';

import 'package:ecommerce_shop_app/controller/cubits/hot_sales_cubit/hot_sales_cubit.dart';
import 'package:ecommerce_shop_app/models/model/product_model.dart';
import 'package:ecommerce_shop_app/view/widgets/build_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotSalesWidget extends StatelessWidget {
  const HotSalesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
        ),
        child: BlocBuilder<HotSalesCubit, HotSalesState>(
            builder: (context, state) {
          if (state is HotSalesInitial) {
            //
            return const InitialHotSalesWidget();
            //
          } else if (state is HotSalesLoaded) {
            //
            return const AfterHotSalesLoaded();
            //
          } else {
            return const Text("SomeThing Went Wrong ");
          }
        }));
  }
}

class AfterHotSalesLoaded extends StatelessWidget {
  const AfterHotSalesLoaded({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final product = BlocProvider.of<HotSalesCubit>(context).hotSales.toList();
    final newList = product.reversed.take(2).toList();

    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          childAspectRatio: 0.6,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        shrinkWrap: true,
        itemCount: newList.length,
        physics: const NeverScrollableScrollPhysics(),
        //
        itemBuilder: (BuildContext context, int index) {
          final prod = newList[index];
          if (product.length > newList.length) {
            product.removeRange(0, product.length - 3);
            return BuildCategoryWidget(productInfoModel: prod);
          } else {
            return BuildCategoryWidget(
              productInfoModel: product[index],
            );
          }
        });
  }
}

class InitialHotSalesWidget extends StatelessWidget {
  const InitialHotSalesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          childAspectRatio: 0.6,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        shrinkWrap: true,
        itemCount: min(
          2,
          ProductInfoModel.products
              .where((categoryType) => categoryType.categoriesType
                  .any((category) => category.categoryName == "All"))
              .length,
        ),
        //
        physics: const NeverScrollableScrollPhysics(),
        //
        itemBuilder: (BuildContext context, int index) {
          final productsToDisplay = ProductInfoModel.products
              .where((categoryType) => categoryType.categoriesType
                  .any((category) => category.categoryName == "All"))
              .take(2);

          if (index < productsToDisplay.length &&
              BlocProvider.of<HotSalesCubit>(context).hotSales.isEmpty) {
            final product = productsToDisplay.elementAt(index);
            return BuildCategoryWidget(
              productInfoModel: product,
            );
          }
          return null;
        });
  }
}
