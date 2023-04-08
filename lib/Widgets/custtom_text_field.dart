import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Screens/Tailor Panel/set_up_your_shop_screen.dart';
import '../Utils/AppColors/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  Icon icon;
  Widget? suffixIcon;
  bool obscureText = false;

  String? Function(String? value)? validate;
  TextEditingController? controller;
  CustomTextField(
      {super.key,
      this.suffixIcon,
      required this.obscureText,
      this.hintText,
      required this.icon,
      this.validate,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Material(
        elevation: 2.0,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: TextFormField(
          obscureText: obscureText,
          controller: controller,
          validator: validate,
          onChanged: (String value) {},
          cursorColor: const Color(0xfff591919),
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            prefixIcon: Material(
              elevation: 0,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: icon,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 13),
          ),
        ),
      ),
    );
  }
}
