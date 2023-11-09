// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_shop_app/widgets/coustom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_shop_app/my_old_divison/cubit/home_view_cubit.dart';
import 'package:ecommerce_shop_app/my_old_divison/cubit/home_view_state.dart';
import 'package:ecommerce_shop_app/my_old_divison/recorses/colors_manger.dart';
import 'package:ecommerce_shop_app/config/constant.dart';
import 'package:ecommerce_shop_app/my_old_divison/recorses/font_manger.dart';
import '../../my_old_divison/main_app_view/componant_app_widgets/button_widget.dart';
import '../../model/product_model.dart';

class MyCard extends StatefulWidget {
  const MyCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<MyCard> createState() => _MyCardState();
  final ProductInfoModel product;
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          Constant.myCard,
          style: Theme.of(context).textTheme.headlineLarge,
        ),

        // IconButton(
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //     icon: const Icon(Icons.arrow_back_ios_new)),

        //
        //
      ),
      body: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AppGetDataBaseState) {
            final products = state.products;

            // Now you can use the 'products' list to update your UI
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return cardList(
                          context: context,
                          prodectInWidget: product,
                        );
                      },
                    ),
                  ),
                  cardInformationPrice(
                      context: context,
                      productInfoModel: widget.product,
                      products: products),
                ],
              ),
            );
          } else {
            // Handle other states or return a loading indicator
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

cardInformationPrice(
    {required BuildContext context,
    required ProductInfoModel productInfoModel,
    required List<ProductInfoModel> products}) {
  double totalPrice = products.fold(0.0, (previousValue, element) {
    return previousValue + double.parse(productInfoModel.price);
  });

  // final double currentPrice = double.tryParse(productInfoModel.price) ?? 0.0;
  // final double originalPrice = double.tryParse(
  //         productInfoLISTForHotSales[AppCubit.get(context).index].price) ??
  //     0.0;

  // double totalPrice = 0.0;
  // for (var product in productInfoModel) {
  //   totalPrice += double.tryParse(productInfoModel.price) ?? 0.0;
  // }
  // // Perform the subtraction
  // final double newPrice = currentPrice + originalPrice;

  return Expanded(
    flex: 2,
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(bottom: AppSize.s10, left: AppSize.s2),
          child: const Text(
            Constant.haveAcoupon,
          ),
        ),
        SizedBox(
          height: 40.h,
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
                Constant.subTotal,
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
                Constant.deliveryFree,
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
                Constant.discount,
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
                Constant.total,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                totalPrice.toString(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
        ButtonWidget(
            onPress: () {}, nameOfBottom: Constant.continueToCustomerDetilis)
      ]),
    ),
  );
}

Widget cardList(
    {required ProductInfoModel prodectInWidget,
    required BuildContext context}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(bottom: AppSize.s10.h, top: AppSize.s5.h),
        // width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
                    height: SizeWidget.s100.h,
                    child: Image.asset(prodectInWidget.prodectImage))),
            Expanded(
                flex: 2,
                child: Container(
                  margin:
                      EdgeInsets.only(left: AppSize.s15.w, top: AppSize.s20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        prodectInWidget.title,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        prodectInWidget.subTitle,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Container(
                          child: Row(
                        children: [
                          Container(
                            width: AppSize.s30.w,
                            child: Text(
                              prodectInWidget.price.toString(),
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                          SizedBox(
                            width: SizeWidget.s60.w,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.do_not_disturb_on_outlined,
                                //
                                // todo  fixed this mistake
                                //
                                size: 25.spMin,
                              )),
                          Container(
                            alignment: Alignment.center,
                            width: 20.w,
                            child: Text(
                              //
                              //
                              //todo make a value when i create cubit

                              prodectInWidget.currentIndex.toString(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_circle_outline_outlined,
                              //
                              // todo  fixed this mistake
                              //
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
    ],
  );
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
