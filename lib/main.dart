import 'package:ecommerce_shop_app/config/app_router.dart';
import 'package:ecommerce_shop_app/config/theme_data.dart';
import 'package:ecommerce_shop_app/cubits/bottomNavigationBar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:ecommerce_shop_app/cubits/category_cubit/category_cubit.dart';
import 'package:ecommerce_shop_app/cubits/counter_cubit/counter_cubit.dart';
import 'package:ecommerce_shop_app/cubits/facebook_signin/facebook_signin_cubit.dart';
import 'package:ecommerce_shop_app/cubits/favorite_icon_cubit/favorite_cubit.dart';
import 'package:ecommerce_shop_app/cubits/google_sginin/google_sign_in_cubit.dart';
import 'package:ecommerce_shop_app/cubits/hot_sales_cubit/hot_sales_cubit.dart';
import 'package:ecommerce_shop_app/screens/main_%20home_view/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubits/bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
          create: (context) => FacebookSigninCubit(),
        ),
        BlocProvider(
          create: (context) => GoogleSignInCubit(),
        ),
        BlocProvider(
          create: (context) => CategoryCubit(),
        ),
        BlocProvider(
          create: (context) => HotSalesCubit(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(),
        ),
        BlocProvider(
          create: (context) => BottomNavigationBarCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme(),
            onGenerateRoute: AppRouter.onGeneratedRoute,
            initialRoute: HomeView.routeName,
          );
        },
      ),
    );
  }
}
