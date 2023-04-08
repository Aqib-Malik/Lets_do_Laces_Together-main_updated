import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lets_do_laces_together/Screens/login_screen.dart';
import '../Controller/auth_controller.dart';
import '../Utils/AppColors/app_colors.dart';
import '../Utils/AppImages/app_images.dart';
import '../Widgets/custtom_text_field.dart';
import '../Widgets/shop_creat_iamage_picker.dart';

enum SingingCharacter { customer, tailor }

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final authController = Get.put(AuthController());

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _aboutMeController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _deliveryNameController = TextEditingController();
  final TextEditingController _deliveryPhoneNumberController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    _aboutMeController.dispose();
    _phoneNumberController.dispose();
    _deliveryNameController.dispose();
    _deliveryPhoneNumberController.dispose();
    _shopNameController.dispose();
    super.dispose();
  }

  File? _image;
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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AvatarPicker(
                    size: 100.0,
                    onImageSelected: (File image) {
                      setState(() {
                        _image = File(image.path);
                      });
                    },
                    defaultImage: 'https://via.placeholder.com/150',
                  ),
                ],
              ),

              CustomTextField(
                obscureText: false,
                controller: _shopNameController,
                validate: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  } else {
                    return 'Full name is required';
                  }
                },
                icon: Icon(
                  Icons.person,
                  color: AppColors.backGroundColor,
                ),
                hintText: 'Shop Name',
              ),

              CustomTextField(
                obscureText: false,
                controller: _nameController,
                validate: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  } else {
                    return 'Full name is required';
                  }
                },
                icon: Icon(
                  Icons.person,
                  color: AppColors.backGroundColor,
                ),
                hintText: 'Full Name',
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

              CustomTextField(
                obscureText: false,
                controller: _cityController,
                validate: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'City is required';
                  } else {
                    return null;
                  }
                },
                icon:
                    Icon(Icons.location_city, color: AppColors.backGroundColor),
                hintText: 'City',
              ),

              CustomTextField(
                obscureText: false,
                controller: _addressController,
                icon: Icon(Icons.home_work_rounded,
                    color: AppColors.backGroundColor),
                hintText: 'Shop Address',
                validate: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Adress is Required';
                  } else {
                    return null;
                  }
                },
              ),

              CustomTextField(
                obscureText: false,
                controller: _deliveryNameController,
                validate: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  } else {
                    return 'Full name is required';
                  }
                },
                icon: Icon(
                  Icons.person,
                  color: AppColors.backGroundColor,
                ),
                hintText: 'Delivery Name',
              ),

              CustomTextField(
                obscureText: false,
                controller: _deliveryPhoneNumberController,
                validate: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  } else {
                    return 'Full name is required';
                  }
                },
                icon: Icon(
                  Icons.phone,
                  color: AppColors.backGroundColor,
                ),
                hintText: 'Delivery Phone Number',
              ),

              CustomTextField(
                obscureText: false,
                controller: _phoneNumberController,
                icon: Icon(Icons.phone, color: AppColors.backGroundColor),
                hintText: 'Phone Number',
                validate: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Phone Number is Required';
                  } else {
                    return null;
                  }
                },
              ),

              CustomTextField(
                obscureText: false,
                controller: _aboutMeController,
                icon: Icon(Icons.person, color: AppColors.backGroundColor),
                hintText: 'About Me',
                validate: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'About Me is Required';
                  } else {
                    return null;
                  }
                },
              ),

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

              Obx(() {
                return CustomTextField(
                  suffixIcon: IconButton(
                      onPressed: () {
                        authController.obscurePassword1();
                      },
                      icon: Icon(
                        authController.isObscurePass1.value == false
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.backGroundColor,
                      )),
                  obscureText: authController.isObscurePass1.value,
                  controller: _confirmPasswordController,
                  validate: (String? value) {
                    if (!GetUtils.hasMatch(value, _passwordController.text)) {
                      return 'Oop\'s password not match';
                    }
                    return null;
                  },
                  icon: Icon(
                    Icons.lock,
                    color: AppColors.backGroundColor,
                  ),
                  hintText: 'Confirm Password',
                );
              }),

              const SizedBox(
                height: 25,
              ),

              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      color: AppColors.backGroundColor,
                    ),
                    child: Container(
                      width: double.infinity,
                      child: TextButton(
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (_image != null) {
                              Reference ref = FirebaseStorage.instance
                                  .ref()
                                  .child('ShopImg/${_image!.path}');
                              UploadTask uploadTask = ref.putFile(_image!);
                              final TaskSnapshot taskSnapshot =
                                  await uploadTask.whenComplete(() {});
                              var imageUrl =
                                  await taskSnapshot.ref.getDownloadURL();
                              print("img url ${imageUrl.toString()}");
                              authController.addShop(
                                _shopNameController.text.trim(),
                                _nameController.text.trim(),
                                _emailController.text.trim(),
                                _cityController.text.trim(),
                                _addressController.text.trim(),
                                _deliveryNameController.text.trim(),
                                _deliveryPhoneNumberController.text.trim(),
                                _phoneNumberController.text.trim(),
                                _aboutMeController.text.trim(),
                                _passwordController.text.trim(),
                                imageUrl.toString(),
                                context,
                              );
                            }
                          }
                        },
                      ),
                    ),
                  )),

              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.to(const LoginScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Already an Account ? ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                    Text("Log In Now ",
                        style: TextStyle(
                            color: AppColors.backGroundColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            decoration: TextDecoration.underline)),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
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
