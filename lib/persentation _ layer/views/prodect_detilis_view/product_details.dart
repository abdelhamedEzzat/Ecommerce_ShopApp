import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/colors_manger.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/constant.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/images_manger.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/values.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/views/home_%20view/componant/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/models.dart';

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
          title: Text(
        "Product Details",
        style: Theme.of(context).textTheme.headlineLarge,
      )),
      body: Column(
        children: [
          productImageAndBackgroundColor(context),
          SizedBox(
            height: 25.h,
          ),
          productInformation(context),
        ],
      ),
    );
  }

  Widget productImageAndBackgroundColor(BuildContext context) {
    return Expanded(
        child: Container(
      width: MediaQuery.of(context).size.width,
      //color: widget.prodects.colorProdectImage,
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
                    Container(
                      child: Text(
                        widget.prodects.price,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.do_not_disturb_on_outlined,
                                size: 25.spMin,
                              )),
                          Text(
                            "1",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_circle_outline_outlined,
                                size: 25.spMin,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                        color: ColorMangers.buttonColor,
                        borderRadius: BorderRadius.circular(15)),
                    height: 55.h,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 38.w),
                    child: Center(
                      child: Text(
                        Constatnt.addItem,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    )),
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
