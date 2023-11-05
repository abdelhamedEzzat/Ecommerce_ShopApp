import 'package:ecommerce_shop_app/model/models.dart';
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
    return Container(
        margin: const EdgeInsets.only(),
        color: Theme.of(context).colorScheme.onPrimary,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              imageInfoForHotSales(context, productInfoModel),
              Expanded(
                child: GestureDetector(
                  onTap: productInfoModel.onTap,
                  child: Column(
                    children: [
                      titleinfoForHotSales(context, productInfoModel),
                      subTilteinfoForHotSales(context, productInfoModel),
                      priceAndaddIconForHotSales(
                        context,
                        productInfoModel,
                      ),
                    ],
                  ),
                ),
              ),
            ]));
  }
}
