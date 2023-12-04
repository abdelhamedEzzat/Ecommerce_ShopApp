// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecommerce_shop_app/cubits/counter_cubit/counter_cubit.dart';
import 'package:ecommerce_shop_app/widgets/counter_widget.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_shop_app/model/product_model.dart';
import 'package:ecommerce_shop_app/widgets/coustom_appbar.dart';
import 'package:ecommerce_shop_app/widgets/finance_details_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCard extends StatelessWidget {
  static const String routeName = "My Card";
  static Route route(ProductInfoModel productInfoModel) {
    return MaterialPageRoute(
      builder: (_) => MyCard(productInfoModel: productInfoModel),
      settings: const RouteSettings(name: routeName),
    );
  }

  final ProductInfoModel productInfoModel;
  const MyCard({
    Key? key,
    required this.productInfoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("MyCard"),
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: BlocProvider.of<CounterCubit>(context)
                        .selectedProducts
                        .length,
                    itemBuilder: (context, index) =>
                        CardProductWidget(productInfoModel: productInfoModel),
                  ),
                ),
                const Expanded(
                  flex: 4,
                  child: FinanceDetailsWidget(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class CardProductWidget extends StatelessWidget {
  final ProductInfoModel productInfoModel;
  const CardProductWidget({
    Key? key,
    required this.productInfoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: Image.asset(
                productInfoModel.prodectImage,
              ),
            ),
            Expanded(
              child: ListTile(
                iconColor: Colors.black,
                contentPadding: const EdgeInsets.only(top: 20),
                title: Text(productInfoModel.title,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productInfoModel.subTitle,
                        style: Theme.of(context).textTheme.bodyLarge),

                    //todo this row will be PriceAndCount widget

                    Row(
                      children: [
                        Text("\$",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface)),
                        Text(
                            productInfoModel.count == 1
                                ? productInfoModel.priceProduct =
                                    productInfoModel.price
                                : productInfoModel.priceProduct,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface)),
                        const Spacer(),
                        CounterWidget(
                          productInfoModel: productInfoModel,
                        ),
                      ],
                    )
                  ],
                ),
                isThreeLine: true,
              ),
            )
          ],
        ),
        const Divider(
          color: Colors.black54,
        ),
      ],
    );
  }
}

// Delivery Free:
// Discount:

//  BlocConsumer<AppCubit, AppState>(
//   listener: (context, state) {},
//   builder: (context, state) {
//     if (state is AppGetDataBaseState) {
//       final products = state.products;

//       // Now you can use the 'products' list to update your UI
//     Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Expanded(
//               flex: 2,
//               child: ListView.builder(
//                 itemCount: products.length,
//                 itemBuilder: (context, index) {
//                   final product = products[index];
// return cardList(
//   context: context,
//   prodectInWidget: product,
// );
//                 },
//               ),
//             ),
//             cardInformationPrice(
//                 context: context,
//                 productInfoModel: widget.product,
//                 products: products),
//           ],
//         ),
//       );
//     } else {
//       // Handle other states or return a loading indicator
//       return CircularProgressIndicator();
//     }
//   },
// ),

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

// class MyCard extends StatefulWidget {
//   const MyCard({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<MyCard> createState() => _MyCardState();
// }

// class _MyCardState extends State<MyCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: CustomAppBar(
//           title: Text(
//             Constant.myCard,
//             style: Theme.of(context).textTheme.headlineLarge,
//           ),

//           // IconButton(
//           //     onPressed: () {
//           //       Navigator.of(context).pop();
//           //     },
//           //     icon: const Icon(Icons.arrow_back_ios_new)),

//           //
//           //
//         ),
//         body:

//          Expanded(
//           flex: 2,
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width,
//             child: Column(children: [
//               Container(
//                 alignment: Alignment.topLeft,
//                 padding: const EdgeInsets.only(bottom: AppSize.s10, left: 2),
//                 child: const Text(
//                   Constant.haveAcoupon,
//                 ),
//               ),
//               SizedBox(
//                 height: 40.h,
//                 child: TextFormField(
//                     decoration: InputDecoration(
//                         fillColor: ColorMangers.gray,
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5)))),
//               ),
//               Container(
//                 padding: EdgeInsets.only(
//                   top: 10.h,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       Constant.subTotal,
//                       style: Theme.of(context).textTheme.labelMedium,
//                     ),
//                     Text(
//                       "11150",
//                       style: Theme.of(context).textTheme.labelMedium,
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(
//                   top: 10.h,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       Constant.deliveryFree,
//                       style: Theme.of(context).textTheme.labelMedium,
//                     ),
//                     Text(
//                       "11",
//                       style: Theme.of(context).textTheme.labelMedium,
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(
//                   top: 10.h,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       Constant.discount,
//                       style: Theme.of(context).textTheme.labelMedium,
//                     ),
//                     Text(
//                       "5 %",
//                       style: Theme.of(context).textTheme.labelMedium,
//                     ),
//                   ],
//                 ),
//               ),

//               Container(
//                 padding: EdgeInsets.only(
//                   bottom: 10.h,
//                   top: 5,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       Constant.total,
//                       style: Theme.of(context).textTheme.headlineSmall,
//                     ),
//                     Text(
//                       " totalPrice.toString()",
//                       style: Theme.of(context).textTheme.headlineSmall,
//                     ),
//                   ],
//                 ),
//               ),
//               ButtonWidget(
//                   onPress: () {},
//                   nameOfBottom: Constant.continueToCustomerDetilis)
//             ]),
//           ),
//         ));
//   }
// }

// cardInformationPrice(
//     {required BuildContext context,
//     required ProductInfoModel productInfoModel,
//     required List<ProductInfoModel> products}) {
//   double totalPrice = products.fold(0.0, (previousValue, element) {
//     return previousValue + double.parse(productInfoModel.price);
//   });
// }

// Widget cardList(
//     {required ProductInfoModel prodectInWidget,
//     required BuildContext context}) {
//   return Column(
//     children: [
//       Container(
//         margin: EdgeInsets.only(bottom: AppSize.s10.h, top: 5.h),
//         // width: MediaQuery.of(context).size.width,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//                 child: Container(
//                     height: 100.h,
//                     child: Image.asset(prodectInWidget.prodectImage))),
//             Expanded(
//                 flex: 2,
//                 child: Container(
//                   margin: EdgeInsets.only(left: 15.w, top: AppSize.s20.h),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         prodectInWidget.title,
//                         style: Theme.of(context).textTheme.labelMedium,
//                       ),
//                       Text(
//                         prodectInWidget.subTitle,
//                         style: Theme.of(context).textTheme.labelSmall,
//                       ),
//                       Container(
//                           child: Row(
//                         children: [
//                           Container(
//                             width: 30.w,
//                             child: Text(
//                               prodectInWidget.price.toString(),
//                               style: Theme.of(context).textTheme.labelMedium,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 60.w,
//                           ),
//                           IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.do_not_disturb_on_outlined,
//                                 //
//                                 // todo  fixed this mistake
//                                 //
//                                 size: 25.spMin,
//                               )),
//                           Container(
//                             alignment: Alignment.center,
//                             width: 20.w,
//                             child: Text(
//                               //
//                               //
//                               //todo make a value when i create cubit

//                               prodectInWidget.currentIndex.toString(),
//                               style: Theme.of(context).textTheme.bodyLarge,
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () {},
//                             icon: Icon(
//                               Icons.add_circle_outline_outlined,
//                               //
//                               // todo  fixed this mistake
//                               //
//                               size: 25.spMin,
//                             ),
//                           ),
//                         ],
//                       )),
//                     ],
//                   ),
//                 ))
//           ],
//         ),
//       ),
//       const Divider(
//         thickness: 0.5,
//         color: ColorMangers.black,
//       ),
//     ],
//   );
// }
