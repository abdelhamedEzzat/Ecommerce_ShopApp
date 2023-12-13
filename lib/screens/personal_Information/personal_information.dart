// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_shop_app/cubits/text_field/text_field_cubit.dart';
import 'package:ecommerce_shop_app/screens/main_%20home_view/home_view.dart';
import 'package:ecommerce_shop_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});
  static const String routeName = "PersonalInformationScreen";
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const PersonalInformationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: BlocBuilder<TextFieldCubit, TextFieldState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to Your Own Store",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller:
                      BlocProvider.of<TextFieldCubit>(context).nameContraller,
                  label: "Enter Your Name",
                  isPassword: false,
                  textInputType: TextInputType.name,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller:
                      BlocProvider.of<TextFieldCubit>(context).ageContraller,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  label: "Age",
                  isPassword: false,
                  textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller:
                      BlocProvider.of<TextFieldCubit>(context).emailContraller,
                  label: "Email",
                  isPassword: false,
                  textInputType: TextInputType.name,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 65.h,
                    width: 65.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: IconButton(
                        iconSize: 60,
                        icon:
                            const Icon(Icons.arrow_right, color: Colors.white),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, HomeView.routeName);
                        }),
                  ),
                )
              ],
            );
          },
        ),
      ),
    ));
  }
}
