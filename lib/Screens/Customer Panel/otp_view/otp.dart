import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lets_do_laces_together/Controller/auth_controller.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';
import 'package:lets_do_laces_together/Utils/AppImages/app_images.dart';

class OTPView extends StatefulWidget {

  final String verificationID;
  // final String email;
  // final String password;
  const OTPView({Key? key, required this.verificationID, 
  // required this.email, required this.password
  }) : super(key: key);

  @override
  State<OTPView> createState() => _LoginViewState();
}

class _LoginViewState extends State<OTPView> {
  final authController = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 137.h,
                    width: 186.w,
                    child: Image.asset(
                      AppImages.AppLogo,
                      color: AppColors.backGroundColor,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const Text(
                    'OTP',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  const Text(
                    'Enter OTP, we have send it to your phone number you entered',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Enter OTP')),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 32, vertical: 6),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      child: TextFormField(
                        controller: _otpController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Can\'t be empty';
                          }
                          if (text.length < 6) {
                            return 'Enter 6 Number OTP';
                          }
                          return null;
                        },
                        onChanged: (String value) {},
                        cursorColor: const Color(0xfff591919),
                        decoration: InputDecoration(
                          hintText: "Enter OTP",
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Icon(
                              Icons.message,
                              color: AppColors.backGroundColor,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      color: AppColors.backGroundColor,
                    ),
                    child: TextButton(
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          authController.oTP(_otpController.text.toString(),
                              widget.verificationID, context);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
