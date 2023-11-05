import 'package:ecommerce_shop_app/config/constant.dart';
import 'package:ecommerce_shop_app/my_old_divison/recorses/font_manger.dart';
import 'package:ecommerce_shop_app/widgets/category_section_widget.dart';
import 'package:ecommerce_shop_app/widgets/featured_product_widget.dart';
import 'package:ecommerce_shop_app/widgets/hot_sales_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/promo_widget.dart';
import '../../widgets/category_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
//final ScrollController _scrollController = ScrollController();
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
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        height: SizeWidget.s130.h,
        child: const PromoListView(),
      ),
      SizedBox(
        height: SizeWidget.s10.h,
      ),
      Container(
        margin: EdgeInsets.only(left: 20.w),
        height: SizeWidget.s20.h,
        child: const CotegoryListView(),
      ),
      SizedBox(
        height: SizeWidget.s10.h,
      ),
      Column(
        children: [
          categorySection(context,
              sectionName: Constant.sectionHotSales, seeAll: Constant.seeALL),
          //
          const HotSalesWidget(),
          //
          SizedBox(
            height: 15.h,
          ),
          categorySection(context,
              sectionName: Constant.featuredProducts, seeAll: Constant.seeALL),
          const FeaturedProductWidget()
        ],
      )
    ]));
  }
}
