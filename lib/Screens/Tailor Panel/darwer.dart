import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lets_do_laces_together/Screens/Tailor%20Panel/orderLists/order_notification.dart';
import 'package:lets_do_laces_together/Screens/Tailor%20Panel/tailor_profile.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';
import '../../Controller/auth_controller.dart';

class CustomDrawer extends StatefulWidget {
  final String? uid;
  const CustomDrawer({Key? key, this.uid}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authController.users
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .snapshots(),
      builder: (context, snapshot) {
        final List<DocumentSnapshot> data = snapshot.data!.docs;
        return SizedBox.expand(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      CircleAvatar(
                          radius: 55,
                          backgroundColor: AppColors.backGroundColor,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage(data[index]['imgUrl']),
                          )),
                      SizedBox(
                        width: 7.w,
                      ),
                      Text(
                        data[index]['name'],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        data[index]['email'],
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 3,
                    color: Colors.white,
                  ),
                  ListTile(
                    title: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.home,
                          size: 23,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Home View",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.person,
                          size: 23,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Profile",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      Get.to(TailorProfile(
                        uid: FirebaseAuth.instance.currentUser?.uid,
                      ));
                    },
                  ),
                   ListTile(
                    title: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.home,
                          size: 23,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Notifications",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      Get.to(NotificationScreen());
                    },
                  ),
                 
                  ListTile(
                    title: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.logout,
                          size: 23,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Log Out",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      authController.shopLogOut(context);
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
