// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_shop_app/widgets/componant_widgets/prodect_info_wdget.dart';
import 'package:ecommerce_shop_app/widgets/home_view_widget/prodect_info_list.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/colors_manger.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/constant.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/font_manger.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/images_manger.dart';
import 'package:ecommerce_shop_app/widgets/componant_widgets/app_bar_widget.dart';
import 'package:ecommerce_shop_app/widgets/componant_widgets/category_Section.dart';
import 'package:ecommerce_shop_app/widgets/componant_widgets/list_view_builder_widget.dart';
import 'package:ecommerce_shop_app/widgets/home_view_widget/advertisements_widget.dart';
import 'package:ecommerce_shop_app/widgets/home_view_widget/category_list.dart';
import 'package:ecommerce_shop_app/widgets/home_view_widget/category_widget.dart';
import 'package:ecommerce_shop_app/widgets/home_view_widget/list_ad.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();

  // intial state for advertisement
  //
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     double minScrollContraller = _scrollController.position.minScrollExtent;
  //     double maxScrollContraller = _scrollController.position.maxScrollExtent;

  //     animateFromMinToMax(
  //         maxScrollContraller,
  //         minScrollContraller,
  //         maxScrollContraller,
  //         Curves.linear,
  //         durationSecond20,
  //         _scrollController);
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorMangers.backGroundColor,
      appBar: appBarWidget(
        title: Image.asset(
          AssetsImages.logoImage,
          height: SizeWidget.s24.h,
          width: SizeWidget.s104.w,
        ),
      ),
      drawer: const Drawer(),
      body: Column(children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                  height: SizeWidget.s160.h,
                  child: listViewBuilder(
                      controller: _scrollController,
                      itemCount: adList.length,
                      scrollDirection: Axis.horizontal,
                      shirnkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return advertisementsUi(context, adList[index]);
                      })),
            ),
          ],
        ),
        //

        Row(
          children: [
            Expanded(
              child: Container(
                height: SizeWidget.s29,
                margin: const EdgeInsets.only(
                    left: AppSize.s20, bottom: AppSize.s20),
                child: listViewBuilder(
                    itemCount: categoryList.length,
                    shirnkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return categoryWidget(context, categoryList[index]);
                    }),
              ),
            ),
          ],
        ),

        categorySection(
          context,
          sectionName: Constatnt.sectionHotSales,
          seeAll: Constatnt.seeALL,
        ),

        Container(
          margin: EdgeInsets.only(left: 10.w, right: 10.w),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10.h,
                crossAxisCount: 2,
                childAspectRatio: 0.71.h,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return prodectInfoWidget(context, productInfoLIST[index]);
              }),
        )
      ]),
    );
  }
}
