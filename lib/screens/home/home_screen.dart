// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shop_app/config/constant.dart';
import 'package:ecommerce_shop_app/config/images_manger.dart';
import 'package:ecommerce_shop_app/cubits/hot_sales_cubit/hot_sales_cubit.dart';
import 'package:ecommerce_shop_app/cubits/text_field/text_field_cubit.dart';
import 'package:ecommerce_shop_app/widgets/Bag_icon_in_appbar_widget.dart';
import 'package:ecommerce_shop_app/widgets/category_section_widget.dart';
import 'package:ecommerce_shop_app/widgets/coustom_appbar.dart';
import 'package:ecommerce_shop_app/widgets/custom_drawer_widget.dart';
import 'package:ecommerce_shop_app/widgets/featured_product_widget.dart';
import 'package:ecommerce_shop_app/widgets/hot_sales_widget.dart';

import '../../widgets/category_widget.dart';
import '../../widgets/promo_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          icon: const BagIconChangedWithNumberOfProduct(),
          title: Center(
            child:
                Image.asset(AssetsImages.logoImage, height: 24.h, width: 104.w),
          ),
        ),
        drawer: BlocBuilder<TextFieldCubit, TextFieldState>(
          builder: (context, state) {
            return const Stack(children: [
              DrawerClass(),
            ]);
          },
        ),
        body: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 130.h,
            child: const PromoListView(),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 20.w),
            height: 20.h,
            child: const CotegoryListView(),
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            children: [
              categorySection(context,
                  sectionName: Constant.sectionHotSales,
                  seeAll: Constant.seeALL),
              //
              BlocBuilder<HotSalesCubit, HotSalesState>(
                builder: (context, state) {
                  return const HotSalesWidget();
                },
              ),
              //
              SizedBox(
                height: 15.h,
              ),
              categorySection(context,
                  sectionName: Constant.featuredProducts,
                  seeAll: Constant.seeALL),
              const FeaturedProductWidget()
            ],
          )
        ])));
  }
}
