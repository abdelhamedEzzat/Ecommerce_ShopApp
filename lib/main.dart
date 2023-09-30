import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/theme_data.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/views/home_%20view/my_cart/my_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_view.dart';
import 'persentation _ layer/views/prodect_detilis_view/product_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getApplicationTheme(),
          home: const HomeView(),
        );
      },
    );
  }
}
