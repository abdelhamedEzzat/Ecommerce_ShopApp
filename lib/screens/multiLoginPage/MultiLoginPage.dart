// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:ecommerce_shop_app/cubits/facebook_signin/facebook_signin_cubit.dart';
// import 'package:ecommerce_shop_app/cubits/google_sginin/google_sign_in_cubit.dart';
// import 'package:ecommerce_shop_app/screens/main_%20home_view/home_view.dart';
// import 'package:ecommerce_shop_app/widgets/login_type_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:ecommerce_shop_app/config/images_manger.dart';

// class MultiLoginPage extends StatelessWidget {
  //  static const String routeName = "MultiLoginPage";
  // static Route route() {
  //   return MaterialPageRoute(
  //     builder: (_) => const MultiLaginPage(),
  //     settings: const RouteSettings(name: routeName),
  //   );
  // }
//   const MultiLoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Theme.of(context).colorScheme.primary,
//       //   title: Text("Log in"),
//       // ),
//       body: SafeArea(
//           child: Container(
//               padding: EdgeInsets.only(top: 35.h, right: 10, left: 10),
//               color: Theme.of(context).colorScheme.primary,
//               alignment: Alignment.topCenter,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   //
//                   Image.asset(AssetsImages.logoImage),
//                   //
//                   //
//                   ListTile(
//                     contentPadding: const EdgeInsets.only(),
//                     titleAlignment: ListTileTitleAlignment.center,
//                     title: Container(
//                       padding: const EdgeInsets.only(bottom: 10),
//                       child: Text(
//                         "Login or create an account",
//                         textAlign: TextAlign.center,
//                         style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                             color: Theme.of(context).colorScheme.onPrimary),
//                       ),
//                     ),
//                     subtitle: Text(
//                       textAlign: TextAlign.center,
//                       "Login or create an account to receive rewards and save your details for faster checkout experience",
//                       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                           color: Theme.of(context).colorScheme.onPrimary),
//                     ),
//                   ),

//                   //
//                   Column(
//                     children: [
//                       BlocConsumer<GoogleSignInCubit, GoogleSignInState>(
//                         listener: (context, state) {
//                           if (state is GoogleSignLoading) {
//                             const CircularProgressIndicator();
//                           } else if (state is GoogleSignLoaded) {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const HomeView(),
//                                 ));
//                           } else if (state is GoogleSignFaild) {
//                             print(state.error);
//                           }
//                         },
//                         builder: (context, state) {
//                           return LoginType(
//                               tilteOuth: " Continue with Google",
//                               imageOuth: AssetsImages.googleIcon,
//                               onTap: () async {
//                                 BlocProvider.of<GoogleSignInCubit>(context)
//                                     .signInWithGoogle();
//                               });
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       BlocConsumer<FacebookSigninCubit, FacebookSigninState>(
//                         listener: (context, state) {
//                           if (state is FacebookSignLoading) {
//                             const CircularProgressIndicator();
//                           } else if (state is FacebookSignLoaded) {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const HomeView(),
//                                 ));
//                           } else if (state is FacebookSignFaild) {
//                             print(state.error);
//                           }
//                         },
//                         builder: (context, state) {
//                           return LoginType(
//                             tilteOuth: " Continue with FaceBook",
//                             imageOuth: AssetsImages.facebookIcon,
//                             onTap: () {
//                               BlocProvider.of<FacebookSigninCubit>(context)
//                                   .signInWithFacebook();
//                             },
//                           );
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       LoginType(
//                         tilteOuth: " Continue with Email",
//                         imageOuth: AssetsImages.leterIcon,
//                         onTap: () {},
//                       ),
//                     ],
//                   ),
//                 ],
//               ))),
//     );
//   }
// }
