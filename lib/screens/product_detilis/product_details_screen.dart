// ignore_for_file: unrelated_type_equality_checks

import 'package:ecommerce_shop_app/config/images_manger.dart';
import 'package:ecommerce_shop_app/cubits/counter_cubit/counter_cubit.dart';
import 'package:ecommerce_shop_app/model/product_model.dart';
import 'package:ecommerce_shop_app/config/constant.dart';
import 'package:ecommerce_shop_app/widgets/coustom_appbar.dart';
import 'package:ecommerce_shop_app/widgets/product_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/button_widget.dart';
import '../my_card/my_card_screen.dart';

class ProductDetails extends StatelessWidget {
  static const String routeName = "ProductDetails";
  static Route route(ProductInfoModel products) {
    return MaterialPageRoute(
      builder: (_) => ProductDetails(products: products),
      settings: const RouteSettings(name: routeName),
    );
  }

  const ProductDetails({
    super.key,
    required this.products,
  });
  final ProductInfoModel products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        icon: Stack(
          children: [
            Image.asset(AssetsImages.bagIcons),
          ],
        ),
        title: const Text("ProductDetails"),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // this  class ProductImageAndBackgroundColor for the
              //first half of screen for image of product and backGroundColor For it

              ProductImageAndBackgroundColor(
                productDetails: products,
              ),
              SizedBox(
                height: 25.h,
              ),

              // this class ProductInformation for title and FavoriteIcon
              // and description and Price and counter For Product And ButtonWidget
              //that every  items is in single class .

              ProductInformation(
                productinformation: products,
              )
            ]),
      ),
    );
  }
}

class ProductImageAndBackgroundColor extends StatelessWidget {
  const ProductImageAndBackgroundColor({
    super.key,
    required this.productDetails,
  });

  final ProductInfoModel productDetails;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Color(
          productDetails.colorProdectImage,
        ),
        child: Image.asset(
          productDetails.prodectImage,
        ),
      ),
    );
  }
}

class ProductInformation extends StatelessWidget {
  const ProductInformation({
    super.key,
    required this.productinformation,
  });

  final ProductInfoModel productinformation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //

          TitleAndFavoriteIcons(productinformation: productinformation),

          SizedBox(
            height: 20.h,
          ),

          //

          DiscriptionWidget(productinformation: productinformation),

          //

          PriceAndCount(productinformation: productinformation),

          //
          ButtonWidget(
              nameOfBotton: Constant.addItem,
              onPress: () {
                Navigator.of(context)
                    .pushNamed(MyCard.routeName, arguments: productinformation);

                BlocProvider.of<CounterCubit>(context)
                    .addItemToBag(productinformation);
                BlocProvider.of<CounterCubit>(context).finance();
                BlocProvider.of<CounterCubit>(context).financeDeliveryFee();
                BlocProvider.of<CounterCubit>(context)
                    .totalFinance(productinformation);
              }),
        ],
      ),
    ));
  }
}
