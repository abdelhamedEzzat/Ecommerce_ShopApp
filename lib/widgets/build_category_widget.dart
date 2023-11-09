import 'package:ecommerce_shop_app/model/product_model.dart';
import 'package:ecommerce_shop_app/screens/product_detilis/product_details_screen.dart';
import 'package:flutter/material.dart';

import 'prodect_info_widget.dart';

class BuildCategoryWidget extends StatelessWidget {
  final ProductInfoModel productInfoModel;

  const BuildCategoryWidget({
    super.key,
    required this.productInfoModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetails(
            products: productInfoModel,
          ),
        ));
      },
      child: Container(
          margin: const EdgeInsets.only(),
          color: Theme.of(context).colorScheme.onPrimary,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ImageInfoWidget(productInfo: productInfoModel),
                Expanded(
                  child: GestureDetector(
                    onTap: productInfoModel.onTap,
                    child: Column(
                      children: [
                        TitleInfoWidget(
                          productInfo: productInfoModel,
                        ),
                        SubTitleInfoWidget(
                          productInfo: productInfoModel,
                        ),
                        PriceAndIconWidget(
                          productInfo: productInfoModel,
                        ),
                      ],
                    ),
                  ),
                ),
              ])),
    );
  }
}
