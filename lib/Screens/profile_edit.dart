import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lets_do_laces_together/Controller/auth_controller.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';
import 'package:lets_do_laces_together/Widgets/custtom_text_field.dart';
import '../Utils/AppImages/app_images.dart';
import '../Views/Admin Panel/admin_login_screen.dart';

class ProfileEditScreen extends StatefulWidget {
  String img;
  String name;
  String city;
  String shopAddress;
  String phoneNumber;
  String aboutMe;
  ProfileEditScreen(
      {Key? key,
      required this.name,
      required this.city,
      required this.shopAddress,
      required this.phoneNumber,
      required this.aboutMe,
      required this.img})
      : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final authController = Get.put(AuthController());
  CollectionReference users = FirebaseFirestore.instance.collection('shop');
  final fireStore = FirebaseFirestore.instance.collection('shop').snapshots();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _aboutMeController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    _aboutMeController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _nameController.text = widget.name;
    _cityController.text = widget.city;
    _addressController.text = widget.shopAddress;
    _phoneNumberController.text = widget.phoneNumber;
    _aboutMeController.text = widget.aboutMe;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SizedBox.expand(
          child: StreamBuilder<QuerySnapshot>(
            stream: fireStore,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              final List<DocumentSnapshot> data = snapshot.data!.docs;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ClipPath(
                        clipper: WaveClipper1(),
                        child: Container(
                          width: double.infinity,
                          height: 240,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                            AppColors.backGroundColor,
                            AppColors.backGroundColor,
                          ])),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 30,
                              ),
                              Image.asset(
                                AppImages.AppLogo,
                                color: Colors.white,
                                height: 100,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                NetworkImage(widget.img.toString()),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
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
                        controller: _cityController,
                        validate: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'City is required';
                          } else {
                            return null;
                          }
                        },
                        icon: Icon(Icons.location_city,
                            color: AppColors.backGroundColor),
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
                        controller: _phoneNumberController,
                        icon:
                            Icon(Icons.phone, color: AppColors.backGroundColor),
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
                        icon: Icon(Icons.person,
                            color: AppColors.backGroundColor),
                        hintText: 'About Me',
                        validate: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'About Me is Required';
                          } else {
                            return null;
                          }
                        },
                      ),
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
                          child: SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              child: const Text(
                                "Update",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.backGroundColor,
                                        ),
                                      );
                                    },
                                    barrierDismissible: false,
                                  );
                                  users
                                      .doc(snapshot.data!.docs[index]['uid']
                                          .toString())
                                      .update({
                                    'name': _nameController.text.toString(),
                                    'city': _cityController.text.toString(),
                                    'shop': _addressController.text.toString(),
                                    'phone':
                                        _phoneNumberController.text.toString(),
                                    'about': _aboutMeController.text.toString(),
                                  }).then(
                                    (value) {
                                      Navigator.pop(context);
                                      Get.back();
                                      Get.snackbar(
                                        'Congratulation',
                                        'Successfully Update',
                                        icon: const Icon(
                                            Icons.notifications_active,
                                            color: Colors.red),
                                        snackPosition: SnackPosition.TOP,
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
