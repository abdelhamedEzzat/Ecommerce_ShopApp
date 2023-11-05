import 'package:ecommerce_shop_app/config/theme_data.dart';
import 'package:ecommerce_shop_app/cubit/cubi_cubit.dart';
import 'package:ecommerce_shop_app/my_old_divison/main_app_view/main_%20home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_old_divison/cubit/home_view_cubit.dart';
import 'my_old_divison/main_app_view/componant_app_widgets/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..initDatabase(),
        ),
        BlocProvider(
          create: (context) => CubiCubit(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme(),
            home: const HomeView(),
          );
        },
      ),
    );
  }
}
