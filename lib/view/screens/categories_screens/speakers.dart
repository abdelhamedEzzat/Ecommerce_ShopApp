import 'package:ecommerce_shop_app/models/model/product_model.dart';
import 'package:ecommerce_shop_app/view/widgets/build_category_widget.dart';
import 'package:ecommerce_shop_app/view/widgets/coustom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpeakersCategoryScreen extends StatelessWidget {
  const SpeakersCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: Text("Speakers Products")),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 10),
            child: GridView.builder(
              //
              itemCount: ProductInfoModel.products
                  .where((categoryType) => categoryType.categoriesType
                      .any((category) => category.categoryName == "Speakers"))
                  .length,
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
                final product = ProductInfoModel.products
                    .where((categoryType) => categoryType.categoriesType
                        .any((category) => category.categoryName == "Speakers"))
                    .elementAt(index);
                return BuildCategoryWidget(
                  productInfoModel: product,
                );
              },
            ),
          ),
        ));
  }
}
