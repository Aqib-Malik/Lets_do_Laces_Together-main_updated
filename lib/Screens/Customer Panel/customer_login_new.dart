import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lets_do_laces_together/Controller/auth_controller.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';
import 'package:lets_do_laces_together/Widgets/custtom_text_field.dart';
import '../../Utils/AppImages/app_images.dart';
import '../../Widgets/shop_creat_iamage_picker.dart';

class CustomerLoginNew extends StatefulWidget {
  const CustomerLoginNew({Key? key}) : super(key: key);

  @override
  State<CustomerLoginNew> createState() => _CustomerLoginNewState();
}

class _CustomerLoginNewState extends State<CustomerLoginNew> {
  final authController = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  List<dynamic> list = [];
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 100.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Image.asset(
                    AppImages.AppLogo,
                    color: AppColors.backGroundColor,
                    width: 200,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Get All Tailoring Service Here',
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColors.backGroundColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 1,
                      width: 80,
                      color: Colors.grey,
                    ),
                    const Text(
                      'Log In',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 1,
                      width: 80,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                    obscureText: false,
                    controller: _emailController,
                    validate: (value) {
                      if (!GetUtils.isEmail(value!)) {
                        return "Please enter Your Valid email";
                      }
                      return null;
                    },
                    icon: Icon(
                      Icons.email,
                      color: AppColors.backGroundColor,
                    ),
                    hintText: "Email"),
                Obx(() {
                  return CustomTextField(
                    suffixIcon: IconButton(
                        onPressed: () {
                          authController.obscurePassword();
                        },
                        icon: Icon(
                          authController.isObscurePass.value == false
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.backGroundColor,
                        )),
                    obscureText: authController.isObscurePass.value,
                    controller: _passwordController,
                    validate: (String? value) {
                      if (!GetUtils.isLengthGreaterOrEqual(value, 6)) {
                        return 'password must be 6 characters or greater';
                      }
                      return null;
                    },
                    icon: Icon(
                      Icons.lock,
                      color: AppColors.backGroundColor,
                    ),
                    hintText: 'Password',
                  );
                }),
                SizedBox(height: 40.h),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    color: AppColors.backGroundColor,
                  ),
                  child: TextButton(
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        authController
                            .isDocumentExists("customer", _emailController.text)
                            .then((value) {
                          if (value) {
                            authController.Customerlogin(
                                _emailController.text.toString(),
                                _passwordController.text.toString(),
                                context);
                          } else {
                            Get.snackbar(
                              'Invalid',
                              'Invalid Credentials',
                              icon: const Icon(Icons.error, color: Colors.red),
                              snackPosition: SnackPosition.TOP,
                            );
                          }
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 1,
                      width: 130,
                      color: Colors.grey,
                    ),
                    const Text(
                      'OR',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Container(
                      height: 1,
                      width: 130,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        authController.googleSignup(context);
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.backGroundColor,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50))),
                        child: Image.asset(
                          AppImages.googleIcon,
                          height: 70,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        authController.facebook(context);
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.backGroundColor,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Image.asset(
                          AppImages.facebookIcon,
                          height: 70,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                const Text('By continuing you agree to our'),
                const Text(
                  'Terms of services Privacy Policy',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
