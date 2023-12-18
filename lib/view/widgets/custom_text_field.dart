import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final String label;
  final bool isPassword;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  CustomTextField({
    Key? key,
    required this.label,
    this.isPassword = false,
    required this.textInputType,
    this.inputFormatters,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        keyboardType: textInputType,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.primaryContainer),
          // border: OutlineInputBorder(),

          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primaryContainer),
          ),
        ),
      ),
    );
  }
}
