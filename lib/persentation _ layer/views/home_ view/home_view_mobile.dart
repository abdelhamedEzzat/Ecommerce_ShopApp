import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/constant.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'componant/advertisements_widget.dart';
import 'componant/category_section.dart';
import 'componant/category_widget.dart';
import 'componant/prodect_info_list.dart';

class HomeViewMobile extends StatefulWidget {
  const HomeViewMobile({
    super.key,
  });

  @override
  State<HomeViewMobile> createState() => _HomeViewMobileState();
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
class _HomeViewMobileState extends State<HomeViewMobile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: SizeWidget.s130.h,
          child: listViewAdvertisementsWidget(context),
        ),
        SizedBox(
          height: SizeWidget.s10.h,
        ),
        Container(
          margin: EdgeInsets.only(left: 24.w),
          height: SizeWidget.s20.h,
          child: listViewcategoryWidget(),
        ),
        SizedBox(
          height: SizeWidget.s10.h,
        ),
        categorySection(context,
            sectionName: Constant.sectionHotSales, seeAll: Constant.seeALL),
        Container(
          margin: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
          ),
          child: listViewBuilderOFProdectInfoForHotSales(),
        ),
        SizedBox(
          height: 15.h,
        ),
        categorySection(context,
            sectionName: Constant.featuredProducts, seeAll: Constant.seeALL),
        Container(
          margin: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
          ),
          child: listViewBuilderForFeaturedProducts(),
        )
      ]),
    );
  }
}
 
           
           
           
    
            //   // listViewcategoryWidget(),
             
    
              
            
    
             
    
           
    
            //   // Expanded(
            //   //     flex: 8,
            //   //     child: Container(
            //   //       color: Colors.black,
            //   //     ))
            //   // Expanded(
            //   //     flex: 2,
            //   //     child:
            //   //         Container(color: Colors.black, child: Text("sadsadsadsadas"))),
            // ],