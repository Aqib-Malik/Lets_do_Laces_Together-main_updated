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

class CustomerLogin extends StatefulWidget {
  const CustomerLogin({Key? key}) : super(key: key);

  @override
  State<CustomerLogin> createState() => _CustomerLoginState();
}

class _CustomerLoginState extends State<CustomerLogin> {
  final authController = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
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
                      'Log In or Sign Up',
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
                    hintText: "Name"),
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
                    controller: _phoneController,
                    validate: (value) {
                      if (!GetUtils.isPhoneNumber(value!)) {
                        return 'please enter valid phone number';
                      }
                      return null;
                    },
                    icon: Icon(
                      Icons.phone,
                      color: AppColors.backGroundColor,
                    ),
                    hintText: "Phone Number"),
                CustomTextField(
                    obscureText: false,
                    controller: _addressController,
                    validate: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      } else {
                        return 'Address is required';
                      }
                    },
                    icon: Icon(
                      Icons.location_on_outlined,
                      color: AppColors.backGroundColor,
                    ),
                    hintText: "Address"),
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
                        if (_image != null) {
                          Reference ref = FirebaseStorage.instance
                              .ref()
                              .child('customerImg/${_image!.path}');
                          UploadTask uploadTask = ref.putFile(_image!);
                          final TaskSnapshot taskSnapshot =
                              await uploadTask.whenComplete(() {});
                          var imageUrl =
                              await taskSnapshot.ref.getDownloadURL();
                          print("img url ${imageUrl.toString()}");
                          authController.phoneNumber(
                              _nameController.text.toString(),
                              _emailController.text.toString(),
                              _phoneController.text.toString(),
                              _addressController.text.toString(),
                              imageUrl.toString(),
                              context);
                        }
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
