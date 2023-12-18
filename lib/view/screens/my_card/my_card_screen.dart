// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecommerce_shop_app/controller/cubits/counter_cubit/counter_cubit.dart';
import 'package:ecommerce_shop_app/models/model/product_model.dart';
import 'package:ecommerce_shop_app/view/widgets/Bag_icon_in_appbar_widget.dart';
import 'package:ecommerce_shop_app/view/widgets/card_product_in_card_widget.dart';
import 'package:ecommerce_shop_app/view/widgets/coustom_appbar.dart';
import 'package:ecommerce_shop_app/view/widgets/finance_details_widget.dart';
import 'package:flutter/material.dart';
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
    //
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    //
    return Scaffold(
        appBar: CustomAppBar(
          icon: BagIconChangedWithNumberOfProduct(
            productInfoModel: productInfoModel,
          ),
          title: const Text("MyCard"),
        ),
        body: BlocConsumer<CounterCubit, CounterState>(
          listener: (context, state) {
            //
            if (state is CounterIncrementLoaded ||
                state is CounterDecrementLoaded) {
              //
              counterCubit.finance(productInfoModel);
              counterCubit.financeDeliveryFee();
              counterCubit.totalFinance(productInfoModel);
            }
            //
          },
          builder: (context, state) {
            // this if condition when user didnt have Any  product in his card

            if (state is CounterInitial ||
                counterCubit.selectedProducts.isEmpty) {
              //
              return SizedBox(
                height: MediaQuery.of(context).size.height / 1.2,
                width: MediaQuery.of(context).size.width,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      IconData(0xe811, fontFamily: 'MaterialIcons'),
                      // You can use any appropriate icon
                      size: 80.0,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "You don't have any products currently",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );

              //  this else  when user have  product in his card
            } else {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    //this Widget For Build Product Widget
                    //that have details of product that user need to Buy it

                    Expanded(
                      flex: 5,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: BlocProvider.of<CounterCubit>(context)
                            .selectedProducts
                            .length,
                        itemBuilder: (context, index) =>
                            CardProductInCardScreenWidget(
                                productInfoModel: productInfoModel),
                      ),
                    ),
                    //
                    //this Widget For Build Finance Widget
                    //that have details of Price that user need to Buy it

                    Expanded(
                      flex: 4,
                      child: FinanceDetailsWidget(
                          productInfoModel: productInfoModel),
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}
