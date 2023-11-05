import 'dart:math';

import 'package:ecommerce_shop_app/model/product_model.dart';
import 'package:ecommerce_shop_app/widgets/build_category_widget.dart';
import 'package:flutter/material.dart';
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
        child: GridView.builder(
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
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final productsToDisplay = ProductInfoModel.products
                  .where((categoryType) => categoryType.categoriesType
                      .any((category) => category.categoryName == "All"))
                  .take(2);

              if (index < productsToDisplay.length) {
                final product = productsToDisplay.elementAt(index);
                return BuildCategoryWidget(
                  productInfoModel: product,
                );
              } else {
                return const Text("SomeThing Went Wrong");
              }
            }));
  }
}
