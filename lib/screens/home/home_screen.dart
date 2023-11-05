import 'package:ecommerce_shop_app/config/constant.dart';
import 'package:ecommerce_shop_app/cubit/cubi_cubit.dart';

import 'package:ecommerce_shop_app/my_old_divison/recorses/font_manger.dart';
import 'package:ecommerce_shop_app/widgets/category_section_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: Column(children: [
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
        BlocBuilder<CubiCubit, CubiState>(
          builder: (context, state) {
            if (state is CubiLoading) {
              return CircularProgressIndicator();
            } else if (state is CubiLoaded) {
              return Container(
                child: Text("22222222222222222"),
              );
            } else {
              return Column(
                children: [
                  categorySection(context,
                      sectionName: Constant.sectionHotSales,
                      seeAll: Constant.seeALL),
                  Container(
                    margin: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                    ),
                    // child: listViewBuilderOFProdectInfoForHotSales(),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  categorySection(context,
                      sectionName: Constant.featuredProducts,
                      seeAll: Constant.seeALL),
                  Container(
                    margin: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                    ),
                    // child: listViewBuilderForFeaturedProducts(),
                  )
                ],
              );
            }
          },
        )
        // Container(height: 100, width: 100, child: bottom())
      ]),
    );
  }
}





  
 
          
              //    Container(
                  //   height: 100,
                  //   width: 100,
                  //   child: ListView.builder(
                  //       itemCount: ProductInfoModel.products.length,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return newMethod(ProductInfoModel.products[index], index);
                  //       }),
                  // )
             
             
             
  //            Center newMethod(ProductInfoModel productInfoModel, index) {
  //   return Center(
  //       child: Column(
  //           children: productInfoModel.categoriesType
  //               .where(
  //                   (productType) => productType.categoryName.contains('All'))
  //               .map((category) => Container(
  //                     child: Text(productInfoModel.subTitle),
  //                   ))
  //               .toList()));
  // }
           
         
    
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
            // Center newMethod(ProductInfoModel productInfoModel, index) {
//   return Center(
//       child: Column(
//           children: productInfoModel.categoriesType
//               .where((productType) => productType.categoryName == index)
//               .map((category) => Container(
//                     child: Text(productInfoModel.subTitle),
//                   ))
//               .toList()));
// }