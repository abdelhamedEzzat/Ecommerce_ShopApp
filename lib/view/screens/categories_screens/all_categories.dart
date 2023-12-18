// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_shop_app/controller/cubits/category_cubit/category_cubit.dart';
import 'package:ecommerce_shop_app/view/widgets/build_category_widget.dart';
import 'package:ecommerce_shop_app/view/widgets/coustom_appbar.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_shop_app/models/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({
    Key? key,
  }) : super(key: key);

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: Text("All Products")),
        body: SingleChildScrollView(
            child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return const CircularProgressIndicator();
            } else if (state is CategoryLoaded) {
              return Container(
                margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 10),
                child: GridView.builder(
                  //
                  itemCount: ProductInfoModel.products
                      .where((categoryType) => categoryType.categoriesType
                          .any((category) => category.categoryName == "All"))
                      .length,
                  //

                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  shrinkWrap: true,
                  //

                  itemBuilder: (BuildContext context, int index) {
                    final product = ProductInfoModel.products
                        .where((categoryType) => categoryType.categoriesType
                            .any((category) => category.categoryName == "All"))
                        .elementAt(index);
                    return BuildCategoryWidget(
                      productInfoModel: product,
                    );
                  },
                ),
              );
            } else {
              return const Text("SomeThing Went Wrong");
            }
          },
        )));
  }
}
