// ignore_for_file: unrelated_type_equality_checks

import 'package:ecommerce_shop_app/cubits/counter_cubit/counter_cubit.dart';
import 'package:ecommerce_shop_app/cubits/favorite_icon_cubit/favorite_cubit.dart';
import 'package:ecommerce_shop_app/model/product_model.dart';
import 'package:ecommerce_shop_app/config/constant.dart';
import 'package:ecommerce_shop_app/widgets/counter_widget.dart';
import 'package:ecommerce_shop_app/widgets/coustom_appbar.dart';
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
      appBar: const CustomAppBar(
        title: Text("ProductDetails"),
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
                // .push(
                //   MaterialPageRoute(
                //     builder: (context) => MyCard(
                //       productInfoModel: productinformation,
                //       // product: productinformation
                //     ),
                //   ),
                // );
                BlocProvider.of<CounterCubit>(context)
                    .addItemToBag(productinformation);
                BlocProvider.of<CounterCubit>(context).finance();
                BlocProvider.of<CounterCubit>(context).financeDeliveryFee();
                BlocProvider.of<CounterCubit>(context).totalFinance();
              }),
        ],
      ),
    ));
  }
}

class TitleAndFavoriteIcons extends StatelessWidget {
  const TitleAndFavoriteIcons({
    super.key,
    required this.productinformation,
  });

  final ProductInfoModel productinformation;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 3,
          child: SizedBox(
            height: 50.h,
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                productinformation.title,
                maxLines: 1,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
            ),
          ),
        ),
        Expanded(child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            return Container(
                alignment: Alignment.centerRight,
                height: 50.h,
                child: GestureDetector(
                    // onSecondaryTap: () {
                    //   BlocProvider.of<CounterCubit>(context).favorite = false;
                    // },
                    onTap: () {
                      if (productinformation.favorite == false) {
                        BlocProvider.of<FavoriteCubit>(context)
                            .favoriteItemsTrue(productinformation);
                        print(productinformation.favorite);
                        print(BlocProvider.of<FavoriteCubit>(context)
                            .favoriteProducts
                            .length);
                      } else if (productinformation.favorite == true) {
                        BlocProvider.of<FavoriteCubit>(context)
                            .favoriteItemsFalse(productinformation);
                        print(productinformation.favorite);
                        print(
                            "ssssssssssssssssssssss${BlocProvider.of<FavoriteCubit>(context).favoriteProducts.length}");
                      }
                    },
                    child: productinformation.favorite == false
                        ? const Icon(Icons.favorite_border_sharp,
                            size: 45, color: Colors.black)
                        : const Icon(
                            Icons.favorite,
                            size: 45,
                            color: Colors.red,
                          )));
          },
        ))
      ],
    );
  }
}

class DiscriptionWidget extends StatelessWidget {
  const DiscriptionWidget({
    super.key,
    required this.productinformation,
  });

  final ProductInfoModel productinformation;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        productinformation.description,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

class PriceAndCount extends StatelessWidget {
  const PriceAndCount({
    super.key,
    required this.productinformation,
  });

  final ProductInfoModel productinformation;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              "\$",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primaryContainer),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                  productinformation.count == 1
                      ? productinformation.priceProduct =
                          productinformation.price
                      : productinformation.priceProduct,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      )),
            ),
            SizedBox(
              height: 15.h,
            ),
            const Spacer(),
            CounterWidget(productInfoModel: productinformation),
          ],
        );
      },
    );
  }
}

// double cc = double.parse(productinformation.price);
//  double ss = cc * BlocProvider.of<CounterCubit>(context).count;
// : ss.toString(),
// BlocProvider.of<CounterCubit>(context).count == 1
//     ? productinformation.price
