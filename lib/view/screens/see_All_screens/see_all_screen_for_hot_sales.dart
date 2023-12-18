import 'package:ecommerce_shop_app/controller/cubits/hot_sales_cubit/hot_sales_cubit.dart';
import 'package:ecommerce_shop_app/view/widgets/build_category_widget.dart';
import 'package:ecommerce_shop_app/view/widgets/coustom_appbar.dart';
import 'package:ecommerce_shop_app/view/widgets/hot_sales_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeAllScreen extends StatelessWidget {
  static const String routeName = "SeeAllScreen";
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SeeAllScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const SeeAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: Text("Hot Sales")),
        body: SingleChildScrollView(
            child: BlocBuilder<HotSalesCubit, HotSalesState>(
          builder: (context, state) {
            if (state is HotSalesInitial) {
              return const InitialHotSalesWidget();
            } else if (state is HotSalesLoaded) {
              final product =
                  BlocProvider.of<HotSalesCubit>(context).hotSales.toList();

              return Container(
                  margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 10),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.6,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                      shrinkWrap: true,
                      itemCount: product.length,
                      physics: const NeverScrollableScrollPhysics(),
                      //
                      itemBuilder: (BuildContext context, int index) {
                        //  final products = product.sublist(index);

                        return BuildCategoryWidget(
                          productInfoModel: product[index],
                        );
                      }));
            } else {
              return const Text("SomeThing Went Wrong");
            }
          },
        )));
  }
}
