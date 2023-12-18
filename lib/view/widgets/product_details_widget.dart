import 'package:ecommerce_shop_app/controller/cubits/counter_cubit/counter_cubit.dart';
import 'package:ecommerce_shop_app/controller/cubits/favorite_icon_cubit/favorite_cubit.dart';

import 'package:ecommerce_shop_app/models/model/product_model.dart';
import 'package:ecommerce_shop_app/view/widgets/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleAndFavoriteIcons extends StatelessWidget {
  const TitleAndFavoriteIcons({
    super.key,
    required this.productinformation,
  });

  final ProductInfoModel productinformation;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 3,
          child: SizedBox(
            height: 50.h,
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                productinformation.title,
                maxLines: 1,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
            ),
          ),
        ),
        Expanded(child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            return Container(
                alignment: Alignment.centerRight,
                height: 50.h,
                child: GestureDetector(
                    onTap: () {
                      if (productinformation.favorite == false) {
                        BlocProvider.of<FavoriteCubit>(context)
                            .addfavoriteItems(productinformation);
                        // print(productinformation.favorite);
                        // print(BlocProvider.of<FavoriteCubit>(context)
                        //     .favoriteProducts
                        //     .length);
                      } else if (productinformation.favorite == true) {
                        BlocProvider.of<FavoriteCubit>(context)
                            .removefavoriteItems(productinformation);
                        // print(productinformation.favorite);
                        // print(
                        //     "ssssssssssssssssssssss${BlocProvider.of<FavoriteCubit>(context).favoriteProducts.length}");
                      }
                    },
                    child: productinformation.favorite == false
                        ? const Icon(Icons.favorite_border_sharp,
                            size: 45, color: Colors.black)
                        : const Icon(
                            Icons.favorite,
                            size: 45,
                            color: Colors.red,
                          )));
          },
        ))
      ],
    );
  }
}

class DiscriptionWidget extends StatelessWidget {
  const DiscriptionWidget({
    super.key,
    required this.productinformation,
  });

  final ProductInfoModel productinformation;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        productinformation.description,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

class PriceAndCount extends StatelessWidget {
  const PriceAndCount({
    super.key,
    required this.productinformation,
  });

  final ProductInfoModel productinformation;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              "\$",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primaryContainer),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                  productinformation.count == 1
                      ? productinformation.priceProduct =
                          productinformation.price
                      : productinformation.priceProduct,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      )),
            ),
            SizedBox(
              height: 15.h,
            ),
            const Spacer(),
            CounterWidget(productInfoModel: productinformation),
          ],
        );
      },
    );
  }
}
