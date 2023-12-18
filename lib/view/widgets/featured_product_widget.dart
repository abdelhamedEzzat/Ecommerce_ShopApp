import 'package:ecommerce_shop_app/models/model/product_model.dart';
import 'package:ecommerce_shop_app/view/widgets/build_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedProductWidget extends StatelessWidget {
  const FeaturedProductWidget({
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
          //

          itemCount: ProductInfoModel.products
                  .where((categoryType) => categoryType.categoriesType
                      .any((category) => category.categoryName == "All"))
                  .length -
              2,
          //

          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            childAspectRatio: 0.6,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          shrinkWrap: true,
          //

          itemBuilder: (BuildContext context, int index) {
            final productsToDisplay = ProductInfoModel.products
                .where((categoryType) => categoryType.categoriesType
                    .any((category) => category.categoryName == "All"))
                .skip(2)
                .toList();

            if (index < productsToDisplay.length) {
              final product = productsToDisplay.elementAt(index);
              return BuildCategoryWidget(
                productInfoModel: product,
              );
            } else {
              return const Text("SomeThing Went Wrong");
            }
          }),
    );
  }
}
