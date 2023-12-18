// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_shop_app/controller/cubits/favorite_icon_cubit/favorite_cubit.dart';
import 'package:ecommerce_shop_app/view/widgets/build_category_widget.dart';
import 'package:ecommerce_shop_app/view/widgets/coustom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteScreen extends StatelessWidget {
  static const String routeName = "FavoriteScreen";
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const FavoriteScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const FavoriteScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(
          "Favorite Screen",
        ),
      ),
      body: SingleChildScrollView(
          child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          FavoriteCubit favoriteCubit = BlocProvider.of<FavoriteCubit>(context);
          if (state is FavoriteLoading) {
            return const CircularProgressIndicator();
          } else if (state is AddFavoriteLoaded) {
            return Container(
              margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 10),
              child: GridView.builder(
                //
                itemCount: favoriteCubit.favoriteProducts.length,

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
                  favoriteCubit.addfavoriteItems(state.addFavorite);

                  return BuildCategoryWidget(
                    productInfoModel: state.addFavorite,
                  );
                },
              ),
            );
          } else if (state is RemoveFavoriteLoaded) {
            if (favoriteCubit.favoriteProducts.isNotEmpty) {
              return Container(
                margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 10),
                child: GridView.builder(
                  //
                  itemCount: favoriteCubit.favoriteProducts.length,

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

                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    favoriteCubit.removefavoriteItems(state.removeFavorite);

                    return BuildCategoryWidget(
                      productInfoModel: state.removeFavorite,
                    );
                  },
                ),
              );
            } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height / 1.2,
                width: MediaQuery.of(context).size.width,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      // You can use any appropriate icon
                      size: 80.0,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "No favorite items yet",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            }
          } else if (state is FavoriteInitial) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              width: MediaQuery.of(context).size.width,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    // You can use any appropriate icon
                    size: 80.0,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "No favorite items yet",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              width: MediaQuery.of(context).size.width,
              child: const Text("Something Went Wrong"),
            );
          }
        },
      )),
    );
  }
}
