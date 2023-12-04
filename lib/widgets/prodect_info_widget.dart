import 'package:ecommerce_shop_app/model/product_model.dart';
import 'package:ecommerce_shop_app/config/colors_manger.dart';
import 'package:ecommerce_shop_app/config/font_manger.dart';
import 'package:ecommerce_shop_app/config/images_manger.dart';
import 'package:ecommerce_shop_app/screens/my_card/my_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//
// The product details in the list appear,
// including an image, title, subtitle, price, and an icon to add the product to the cart for purchase.
//
//

class ProdectInfoWidget extends StatelessWidget {
  const ProdectInfoWidget({super.key, required this.productInfo, this.press});
  final ProductInfoModel productInfo;
  final void Function()? press;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(),
        color: ColorMangers.white,
        // color: Colors.blueAccent,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ImageInfoWidget(productInfo: productInfo),
              Expanded(
                child: GestureDetector(
                  onTap: productInfo.onTap,
                  child: Column(
                    children: [
                      //
                      TitleInfoWidget(productInfo: productInfo),
                      //
                      SubTitleInfoWidget(productInfo: productInfo),
                      //
                      PriceAndIconWidget(productInfo: productInfo),
                    ],
                  ),
                ),
              ),
            ]));
  }
}

class ImageInfoWidget extends StatelessWidget {
  const ImageInfoWidget({
    super.key,
    required this.productInfo,
  });

  final ProductInfoModel productInfo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Color(productInfo.colorProdectImage),
        margin: EdgeInsets.only(top: 4.h, left: 4.w, right: 4.h, bottom: 8.h),
        width: MediaQuery.of(context).size.width,
        child: Center(child: Image.asset(productInfo.prodectImage)),
      ),
    );
  }
}

class TitleInfoWidget extends StatelessWidget {
  const TitleInfoWidget({
    super.key,
    required this.productInfo,
  });

  final ProductInfoModel productInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      height: AppSize.s16.h,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 23,
      ),
      child: Text(
        productInfo.title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

class SubTitleInfoWidget extends StatelessWidget {
  const SubTitleInfoWidget({
    super.key,
    required this.productInfo,
  });

  final ProductInfoModel productInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 23,
      ),
      child: Text(
        productInfo.subTitle,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
      ),
    );
  }
}

class PriceAndIconWidget extends StatelessWidget {
  const PriceAndIconWidget({
    super.key,
    required this.productInfo,
  });

  final ProductInfoModel productInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //
        PriceWidget(
          productInfo: productInfo,
        ),
        //
        IconButtonWidget(productInfo: productInfo),
      ],
    );
  }
}

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    required this.productInfo,
  });
  final ProductInfoModel productInfo;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 21),
      margin: EdgeInsets.only(
          bottom: 10.h, right: MediaQuery.of(context).size.width / AppSize.s12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "\$",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            productInfo.price.toString(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.productInfo,
  });

  final ProductInfoModel productInfo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
          onPressed: () {
            // AppCubit.get(context).insertProduct(productInfo);
            // AppCubit.get(context).getAllProducts(productInfo);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MyCard(
                  productInfoModel: productInfo,
                ),
              ),
            );
          },
          icon: Image.asset(
            AssetsImages.addIcon,
          )),
    );
  }
}
