import 'package:ecommerce_shop_app/config/colors_manger.dart';
import 'package:ecommerce_shop_app/config/constant.dart';
import 'package:ecommerce_shop_app/config/images_manger.dart';
import 'package:ecommerce_shop_app/controller/cubits/text_field/text_field_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerClass extends StatelessWidget {
  const DrawerClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<TextFieldCubit, TextFieldState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(children: [
              buildHeader(context),
              buildMenuItems(context),
            ]),
          );
        },
      ),
    );
  }
}

Widget buildHeader(BuildContext context) {
  return Container(
    alignment: Alignment.centerLeft,
    width: MediaQuery.of(context).size.width,
    color: ColorMangers.primaryColor,
    padding: EdgeInsets.only(
      left: 40.w,
      bottom: 35.h,
      top: 36.h,
    ),
    child: BlocBuilder<TextFieldCubit, TextFieldState>(
      builder: (context, state) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CircleAvatar(
            radius: 52,
            backgroundImage: AssetImage(AssetsImages.personImage),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            DrawerConstans.welcome,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
          Text(
            BlocProvider.of<TextFieldCubit>(context).nameContraller.text,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
          Text(
            BlocProvider.of<TextFieldCubit>(context).emailContraller.text,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
        ]);
      },
    ),
  );
}

Widget buildMenuItems(
  BuildContext context,
) {
  return Container(
      padding: const EdgeInsets.all(24),
      child: Column(children: [
        //
        //   this For trending list
        //

        trendingWidget(context),

        //
        //   this For topCategories
        //

        topCategories(context),

        //
        //  this  for programsAndFeatures
        //

        programsAndFeatures(context),

        //
        // this for drawer logo
        //

        drawerLogo(context),
      ]));
}

//
//  this for trending list
//

Widget trendingWidget(BuildContext context) {
  return ExpansionTile(
    childrenPadding: const EdgeInsets.only(left: 9),
    title: Text(
      DrawerConstans.trending,
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              DrawerConstans.bestSellers,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              DrawerConstans.newReleases,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              DrawerConstans.moversShakers,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
    ],
  );
}

//
//  this for programsAndFeatures list
//

Widget programsAndFeatures(BuildContext context) {
  return ExpansionTile(
    childrenPadding: const EdgeInsets.only(left: 9),
    title: Text(
      DrawerConstans.programsAndFeatures,
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              DrawerConstans.todayDeals,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              DrawerConstans.tryPrime,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              DrawerConstans.globalStore,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              DrawerConstans.giftCards,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              DrawerConstans.sellonStore,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              DrawerConstans.subscribeSave,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
    ],
  );
}

//
//  this for topCategories list
//

Widget topCategories(BuildContext context) {
  return ExpansionTile(
    childrenPadding: const EdgeInsets.only(left: 9),
    title: Text(
      DrawerConstans.topCategories,
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              DrawerConstans.electronics,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              DrawerConstans.fashion,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              DrawerConstans.computers,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              DrawerConstans.mobilePhones,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              DrawerConstans.sellAllCategories,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
    ],
  );
}

//
//  this for drawerLogo list
//

Widget drawerLogo(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(bottom: 20.h, top: 20.h, left: 20.w),
    alignment: Alignment.centerLeft,
    child: Image.asset(AssetsImages.drawerLogo, height: 100.h),
  );
}
