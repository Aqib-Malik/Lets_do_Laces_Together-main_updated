import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lets_do_laces_together/Screens/siginup_screen.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';

import 'Utils/AppImages/app_images.dart';
import 'Widgets/assets.dart';
import 'Screens/Admin Panel/admin_login_screen.dart';
import 'Screens/Customer Panel/customer_login.dart';
import 'Screens/login_screen.dart';

class AuthPage extends StatelessWidget {
  final String backImg = meal;

  const AuthPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: const EdgeInsets.all(48.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 48.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10.0)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 1.0,
                    sigmaY: 1.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        AppImages.AppLogo,
                        color: AppColors.backGroundColor,
                        width: 200,
                      ),
                      const SizedBox(height: 40.0),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            // highlightElevation: 0,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: const Text("Login As A Customer",
                              style: TextStyle(color: Colors.black)),
                          onPressed: () {
                            Get.to(const CustomerLogin());
                          },
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            elevation: 0,
                            // highlightElevation: 0,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: const Text(
                            "Login As A Tailor",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            Get.to(const LoginScreen());
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: SizedBox(
                          width: 100,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              elevation: 0,
                              // highlightElevation: 0,
                            ),
                            child: Text(
                              "I'm Admin",
                              style: TextStyle(
                                color: AppColors.backGroundColor,
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onPressed: () {
                              Get.to(AdminLogin());
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text.rich(TextSpan(children: [
                        const TextSpan(text: "Don't Have An Shop? "),
                        WidgetSpan(
                            child: InkWell(
                          onTap: () {
                            Get.to(const SignUpScreen());
                          },
                          child: Text("Create Your Shop",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.backGroundColor,
                                decoration: TextDecoration.underline,
                              )),
                        ))
                      ])),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
