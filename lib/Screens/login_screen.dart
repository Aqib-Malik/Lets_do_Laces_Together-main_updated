import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_do_laces_together/Screens/Tailor%20Panel/forgot_screen.dart';
import 'package:lets_do_laces_together/Screens/siginup_screen.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';
import '../Controller/auth_controller.dart';
import '../Utils/AppImages/app_images.dart';
import '../Widgets/custtom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authController = Get.put(AuthController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: WaveClipper2(),
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        AppColors.backGroundColor,
                        AppColors.backGroundColor,
                      ])),
                      child: Column(),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipper3(),
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.pink.shade100])),
                      child: Column(),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipper1(),
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        AppColors.backGroundColor,
                        AppColors.backGroundColor,
                      ])),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 50,
                          ),
                          Image.asset(
                            AppImages.AppLogo,
                            color: Colors.white,
                            height: 110,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
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
              const SizedBox(
                height: 25,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      color: AppColors.backGroundColor,
                    ),
                    child: Container(
                      width: double.infinity,
                      child: TextButton(
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                             authController
                            .isDocumentExists("shop", _emailController.text)
                            .then((value) {
                          if (value) {
                            authController.login(
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
                  )),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 140),
                child: Center(
                  child: GestureDetector(
                      onTap: () {
                        Get.to(const ForgotScreen());
                      },
                      child: const Text(
                        "FORGOT PASSWORD ?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      )),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Don't have an Account ? ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                  InkWell(
                      onTap: () {
                        Get.to(const SignUpScreen());
                      },
                      child: Text("Sign Up ",
                          style: TextStyle(
                              color: AppColors.backGroundColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              decoration: TextDecoration.underline))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
