// // ignore_for_file: unrelated_type_equality_checks

// import 'package:ecommerce_shop_app/my_old_divison/cubit/home_view_cubit.dart';
// import 'package:ecommerce_shop_app/my_old_divison/cubit/home_view_state.dart';
// import 'package:ecommerce_shop_app/config/constant.dart';
// import 'package:ecommerce_shop_app/my_old_divison/recorses/values.dart';
// import 'package:ecommerce_shop_app/my_old_divison/views/home_%20view/componant/app_bar_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../my_old_divison/main_app_view/componant_app_widgets/bottom_widget.dart';
// import '../../model/models.dart';
// import '../../my_old_divison/views/home_ view/componant/prodect_info_list.dart';
// import '../my_card/my_card_screen.dart';

// class ProductDetails extends StatefulWidget {
//   const ProductDetails({
//     super.key,
//     required this.prodects,
//   });
//   final ProductInfoModel prodects;

//   @override
//   State<ProductDetails> createState() => _ProductDetailsState();
// }

// ProductInfoModel? product;

// class _ProductDetailsState extends State<ProductDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: appBarWidget(
//           // (For AppBar Title)

//           Text(
//             "Product Details",
//             style: Theme.of(context).textTheme.headlineLarge,
//           ),

//           // (For AppBar Leading )
//           IconButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               icon: const Icon(Icons.arrow_back_ios_new)),
//         ),
//         body: Column(children: [
//           productImageAndBackgroundColor(
//             context,
//           ),
//           SizedBox(
//             height: 25.h,
//           ),
//           BlocConsumer<AppCubit, AppState>(
//             listener: (context, state) {
//               //
//               //    state
//               //
//               if (state is AppChangePriceIncrement &&
//                   state is AppIncrementState &&
//                   AppCubit.get(context).index >= 0 &&
//                   AppCubit.get(context).index <
//                       productInfoLISTForHotSales.length)
//               //
//               //   Results
//               //
//               {
//                 AppCubit.get(context).finalPriceWithIncrement(
//                     widget.prodects.price as ProductInfoModel);
//                 //
//               } else if
//                   //
//                   //    state
//                   //
//                   (state is AppChangePricedecrement &&
//                       state is AppDecrementState &&
//                       AppCubit.get(context).index >= 0 &&
//                       AppCubit.get(context).index <
//                           productInfoLISTForHotSales.length)
//               //
//               //   Results
//               //
//               {
//                 AppCubit.get(context).finalPriceWithdecrement(
//                     widget.prodects.price as ProductInfoModel);
//               }
//             },
//             builder: (context, state) {
//               return productInformation(
//                 context: context,
//                 productInfo: widget.prodects,
//               );
//             },
//           )
//         ]));
//   }

//   Widget productImageAndBackgroundColor(
//     BuildContext context,
//   ) {
//     return Expanded(
//         child: Container(
//       width: MediaQuery.of(context).size.width,
//       color: Color(
//         widget.prodects.colorProdectImage,
//       ),
//       child: Image.asset(widget.prodects.prodectImage),
//     ));
//   }

//   Widget productInformation({
//     required BuildContext context,
//     required ProductInfoModel productInfo,
//   }) {
//     return Expanded(
//       child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 30.h),
//           child: Container(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Expanded(
//                       child: SizedBox(
//                         height: 50.h,
//                         width: MediaQuery.of(context).size.width,
//                         child: ListTile(
//                           contentPadding: EdgeInsets.zero,
//                           title: Text(
//                             widget.prodects.title,
//                             style: Theme.of(context).textTheme.headlineSmall,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                         child: Container(
//                             decoration: BoxDecoration(),
//                             alignment: Alignment.centerRight,
//                             height: 50.h,
//                             child: GestureDetector(
//                               onTap: AppCubit.get(context).toggleHeartColor,
//                               child: Icon(
//                                 AppCubit.get(context).isHeartRed == false
//                                     ? Icons.favorite_border_sharp
//                                     : Icons.favorite,
//                                 size: 45,
//                                 color: AppCubit.get(context).isHeartRed == false
//                                     ? Colors.black
//                                     : Colors.red,
//                               ),
//                             )
//                             //  Image.asset(
//                             //   AssetsImages.heartImage,
//                             //   color: Colors.red,
//                             //   colorBlendMode: BlendMode.color,
//                             //   fit: BoxFit.fill,
//                             // )
//                             ))
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Container(
//                   child: const Text(Values.subTitleDetails),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           child: Text(
//                             "\$",
//                             style: Theme.of(context).textTheme.headlineSmall,
//                           ),
//                         ),
//                         Container(
//                           child: Text(
//                             AppCubit.get(context).currentIndex == 1
//                                 ? productInfoLISTForHotSales[
//                                         AppCubit.get(context).index]
//                                     .price
//                                     .toString()
//                                 : productInfo.price.toString(),
//                             style: Theme.of(context).textTheme.headlineSmall,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 15.h,
//                     ),
//                     Container(
//                       child: Row(
//                         children: [
//                           IconButton(
//                               onPressed: () {
//                                 AppCubit.get(context).decrement();
//                                 AppCubit.get(context).finalPriceWithdecrement(
//                                   productInfo,
//                                 );
//                               },
//                               icon: Icon(
//                                 Icons.do_not_disturb_on_outlined,
//                                 size: 25.spMin,
//                               )),
//                           Text(
//                             ' ${(productInfo.currentIndex = AppCubit.get(context).currentIndex).toString()}',
//                             //  productInfo.currentIndex =

//                             style: Theme.of(context).textTheme.bodyLarge,
//                           ),
//                           IconButton(
//                               onPressed: () {
//                                 AppCubit.get(context).increment(productInfo);
//                                 AppCubit.get(context)
//                                     .finalPriceWithIncrement(productInfo);

//                                 print("finalPrice ${widget.prodects.price}");
//                               },
//                               icon: Icon(
//                                 Icons.add_circle_outline_outlined,
//                                 size: 25.spMin,
//                               ))
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 bottomWidget(
//                     context: context,
//                     nameOfBottom: Constant.addItem,
//                     onPress: () {
//                       AppCubit.get(context).insertProduct(productInfo);
//                       AppCubit.get(context).getAllProducts(productInfo);
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => MyCard(product: productInfo),
//                         ),
//                       );
//                     })
//               ],
//             ),
//           )),
//     );
//   }
// }

// // class SubTitleDetails {
// //   final String subTitleDetail;

// //   SubTitleDetails({required this.subTitleDetail});
// // }

// // List<SubTitleDetails> detailsList = [
// //   SubTitleDetails(
// //       subTitleDetail:
// //           'Apple-designed dynamic driver provides high-fidelity audio.Note : If the size of the earbud tips does not match the size of your ear canals or the headset is not worn properly in your ears, you may not obtain the correct sound qualities or call performance. Change the earbud tips to ones that fit more snugly in your ear')
// // ];

// // widget.prodects.price == state.products;
// // widget.prodects.price =
// //     productInfoLISTForHotSales[AppCubit.get(context).index]
// //             .price *
// //         AppCubit.get(context).currentIndex;

// // widget.prodects.price = widget.prodects.price -
// //     productInfoLISTForHotSales[AppCubit.get(context).index]
// //         .price;
