import 'package:ecommerce_shop_app/cubit/home_view_cubit.dart';
import 'package:ecommerce_shop_app/cubit/home_view_state.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/constant.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/images_manger.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/values.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/views/home_%20view/componant/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../main_app_view/componant_app_widgets/bottom_widget.dart';
import '../../model/models.dart';
import '../home_ view/componant/prodect_info_list.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
    required this.prodects,
  });
  final ProductInfoModel prodects;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(
          // (For AppBar Title)

          Text(
            "Product Details",
            style: Theme.of(context).textTheme.headlineLarge,
          ),

          // (For AppBar Leading )
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: Column(children: [
          productImageAndBackgroundColor(context),
          SizedBox(
            height: 25.h,
          ),
          BlocConsumer<AppCubit, AppState>(
            listener: (context, state) {
              if (state is AppIncrementState &&
                  AppCubit.get(context).index >= 0 &&
                  AppCubit.get(context).index <
                      productInfoLISTForHotSales.length) {
                widget.prodects.price =
                    productInfoLISTForHotSales[AppCubit.get(context).index]
                            .price *
                        AppCubit.get(context).currentIndex;
              } else if (state is AppDecrementState &&
                  AppCubit.get(context).index >= 0 &&
                  AppCubit.get(context).index <
                      productInfoLISTForHotSales.length) {
                widget.prodects.price = widget.prodects.price -
                    productInfoLISTForHotSales[AppCubit.get(context).index]
                        .price;
              }
              // TODO: implement listener
            },
            builder: (context, state) {
              return productInformation(context);
            },
          )
        ]));
  }

  Widget productImageAndBackgroundColor(BuildContext context) {
    return Expanded(
        child: Container(
      width: MediaQuery.of(context).size.width,
      color: Color(
        widget.prodects.colorProdectImage,
      ),
      child: Image.asset(widget.prodects.prodectImage),
    ));
  }

  Widget productInformation(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.h),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50.h,
                        width: MediaQuery.of(context).size.width,
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            widget.prodects.title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                            alignment: Alignment.centerRight,
                            height: 50.h,
                            child: Image.asset(AssetsImages.heartImage)))
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  child: const Text(Values.subTitleDetails),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text(
                            "\$",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Container(
                          child: Text(
                            AppCubit.get(context).currentIndex == 1
                                ? productInfoLISTForHotSales[
                                        AppCubit.get(context).index]
                                    .price
                                    .toString()
                                : widget.prodects.price.toString(),
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                AppCubit.get(context).decrement();
                              },
                              icon: Icon(
                                Icons.do_not_disturb_on_outlined,
                                size: 25.spMin,
                              )),
                          Text(
                            AppCubit.get(context).currentIndex.toString(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          IconButton(
                              onPressed: () {
                                AppCubit.get(context).increment();
                                print(widget.prodects.price);
                              },
                              icon: Icon(
                                Icons.add_circle_outline_outlined,
                                size: 25.spMin,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                bottomWidget(context: context, nameOfBottom: Constant.addItem)
              ],
            ),
          )),
    );
  }
}



 

// class SubTitleDetails {
//   final String subTitleDetail;

//   SubTitleDetails({required this.subTitleDetail});
// }

// List<SubTitleDetails> detailsList = [
//   SubTitleDetails(
//       subTitleDetail:
//           'Apple-designed dynamic driver provides high-fidelity audio.Note : If the size of the earbud tips does not match the size of your ear canals or the headset is not worn properly in your ears, you may not obtain the correct sound qualities or call performance. Change the earbud tips to ones that fit more snugly in your ear')
// ];
