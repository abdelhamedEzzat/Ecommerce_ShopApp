// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/constant.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/colors_manger.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/images_manger.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/views/home_%20view/componant/app_bar_widget.dart';

import '../../../../widgets/componant_widgets/bottom_widget.dart';

class MyCard extends StatefulWidget {
  const MyCard({super.key});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        // (For AppBar Title)

        Text(
          Constatnt.myCard,
          style: Theme.of(context).textTheme.headlineLarge,
        ),

        // (For AppBar Leading )

        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),

        //
        //
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10.h, top: 5.h),
                  // width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Container(
                              height: SizeWidget.s100.h,
                              child: Image.asset(AssetsImages.headPhoneImage))),
                      Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(left: 20.w, top: 20.h),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "titletitletitle",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(
                                  'sub title',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Container(
                                    child: Row(
                                  children: [
                                    Text(
                                      "450",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    SizedBox(
                                      width: SizeWidget.s75.w,
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.do_not_disturb_on_outlined,
                                          size: 25.spMin,
                                        )),
                                    Text(
                                      "1",
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add_circle_outline_outlined,
                                        size: 25.spMin,
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  color: ColorMangers.black,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10.h, top: 5.h),
                  // width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Container(
                              height: 100.h,
                              child: Image.asset(AssetsImages.headPhoneImage))),
                      Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(left: 20.w, top: 20.h),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "titletitletitle",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(
                                  'sub title',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Container(
                                    child: Row(
                                  children: [
                                    Text(
                                      "450",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    SizedBox(
                                      width: 75.w,
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.do_not_disturb_on_outlined,
                                          size: 25.spMin,
                                        )),
                                    Text(
                                      "1",
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add_circle_outline_outlined,
                                        size: 25.spMin,
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  color: ColorMangers.black,
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(bottom: 10, left: 2),
                  child: const Text(
                    "Have a coupon code? enter here",
                  ),
                ),
                Container(
                  height: 40.h,
                  // decoration: BoxDecoration(
                  //     border: Border.all(),
                  //     borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: ColorMangers.gray,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)))),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 10.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal:",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        "11150",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 10.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Free:",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        "11",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 10.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount:",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        "5 %",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CustomPaint(
                    size: Size(MediaQuery.of(context).size.width,
                        1), // Adjust the size as needed
                    painter: DashedLinePainter(), // Custom painter
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    bottom: 10.h,
                    top: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total:",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        "\$4,458.50",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                bottomWidget(
                    context: context,
                    nameOfBottom: Constatnt.continueToCustomerDetilis)
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.square // Optional: Change the line cap style
      ..style = PaintingStyle.stroke;

    const dashWidth = 5; // Adjust the width of each dash
    const dashSpace = 5; // Adjust the space between dashes

    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );

      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Delivery Free:
// Discount: