import 'package:ecommerce_shop_app/main_app_view/main_%20home_view/home_view.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/home_view_cubit.dart';
import 'main_app_view/componant_app_widgets/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..initDatabase(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: getApplicationTheme(),
            home: HomeView(),
          );
        },
      ),
    );
  }
}
