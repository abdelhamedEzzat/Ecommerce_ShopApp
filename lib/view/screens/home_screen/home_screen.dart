// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_shop_app/controller/cubits/counter_cubit/counter_cubit.dart';
import 'package:ecommerce_shop_app/controller/cubits/hot_sales_cubit/hot_sales_cubit.dart';
import 'package:ecommerce_shop_app/controller/cubits/text_field/text_field_cubit.dart';
import 'package:ecommerce_shop_app/view/widgets/Bag_icon_in_appbar_widget.dart';
import 'package:ecommerce_shop_app/view/widgets/category_section_widget.dart';
import 'package:ecommerce_shop_app/view/widgets/category_widget.dart';
import 'package:ecommerce_shop_app/view/widgets/coustom_appbar.dart';
import 'package:ecommerce_shop_app/view/widgets/custom_drawer_widget.dart';
import 'package:ecommerce_shop_app/view/widgets/featured_product_widget.dart';
import 'package:ecommerce_shop_app/view/widgets/hot_sales_widget.dart';
import 'package:ecommerce_shop_app/view/widgets/promo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_shop_app/config/constant.dart';
import 'package:ecommerce_shop_app/config/images_manger.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
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
          icon: _buildIcon(),
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
          //
          //this is PromoListView for build and  show Promo cards in ui

          SizedBox(
            height: 130.h,
            child: const PromoListView(),
          ),
          SizedBox(
            height: 10.h,
          ),

          //
          //this is PromoListView for build and  show Category cards in ui

          Container(
            margin: EdgeInsets.only(left: 20.w),
            height: 20.h,
            child: const CategoryListView(),
          ),
          SizedBox(
            height: 10.h,
          ),

          //
          //this is PromoListView for build and  show CategorySection  in ui

          Column(
            children: [
              categorySection(context,
                  sectionName: Constant.sectionHotSales,
                  seeAll: Constant.seeALL),

              //
              //this is PromoListView for build and  show HotSales Products  in ui

              BlocBuilder<HotSalesCubit, HotSalesState>(
                builder: (context, state) {
                  return const HotSalesWidget();
                },
              ),
              //
              SizedBox(
                height: 15.h,
              ),

              //
              //this is PromoListView for build and  show featuredProducts Products  in ui

              categorySection(context,
                  sectionName: Constant.featuredProducts,
                  seeAll: Constant.seeALL),
              const FeaturedProductWidget()
            ],
          )
        ])));
  }
  //this Method for build bagIcon  Based on states of counter cubit

  BlocBuilder<CounterCubit, CounterState> _buildIcon() {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        if (state is CounterInitial ||
            BlocProvider.of<CounterCubit>(context).selectedProducts.isEmpty) {
          return SizedBox(
            width: 40.w,
            height: 55.h,
            child: Image.asset(
              AssetsImages.bagIcons,
            ),
          );
        } else if (state is AddProductToPag &&
            BlocProvider.of<CounterCubit>(context)
                .selectedProducts
                .isNotEmpty) {
          return BagIconChangedWithNumberOfProduct(
            productInfoModel: BlocProvider.of<CounterCubit>(context)
                .add(state.productInfoModel),
          );
        } else {
          return const Text("SomeThing Went Wrong");
        }
      },
    );
  }
}
