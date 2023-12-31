import 'package:ecommerce_shop_app/config/colors_manger.dart';
import 'package:ecommerce_shop_app/controller/cubits/category_cubit/category_cubit.dart';
import 'package:ecommerce_shop_app/models/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: CategoryModel.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _CategoryWidget(category: CategoryModel.categories[index]);
        });
  }
}

class _CategoryWidget extends StatelessWidget {
  final CategoryModel category;
  const _CategoryWidget({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return GestureDetector(
        onTap: () {
          BlocProvider.of<CategoryCubit>(context).categoryNav(
            category,
            context,
          );
        },
        child: Container(
            padding: EdgeInsets.only(
              left: mediaQuery.size.width / 20,
              right: mediaQuery.size.width / 20,
              top: mediaQuery.padding.top / 10,
              bottom: mediaQuery.padding.bottom / 10,
            ),
            margin: EdgeInsets.only(
              right: 12.w,
            ),
            decoration: BoxDecoration(
                color: ColorMangers.white,
                border: Border.all(
                  color: ColorMangers.gray,
                ),
                borderRadius: BorderRadius.circular(
                  14,
                )),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  category.iconImage,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  width: 7.w,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Center(
                  child: Text(
                    category.categoryName,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  ),
                )
              ],
            )));
  }
}
