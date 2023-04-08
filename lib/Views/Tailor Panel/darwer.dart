import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Screens/Tailor Panel/notification.dart';
import '../../Screens/Tailor Panel/tailor_home_view.dart';
import '../../Screens/Tailor Panel/tailor_profile.dart';
import '../../Screens/Tailor Panel/tailor_setting.dart';
import '../../auth_page.dart';
import 'Taior_Orders/orders.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 200),
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AuthPage()),
                );
              },
              child: Icon(
                Icons.logout,
                color: Colors.white70,
              )),
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            SizedBox(
              width: 20.w,
            ),
            const CircleAvatar(
                radius: 55,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/3984851/pexels-photo-3984851.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                )),
            SizedBox(
              width: 7.w,
            ),
            Text(
              "Tooba",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Tooba3839@gmail.com",
              style: TextStyle(
                color: Colors.white70,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 3,
          color: Colors.white70,
        ),
        ListTile(
          title: Row(
            children: <Widget>[
              Icon(
                Icons.home,
                size: 23,
                color: Colors.white70,
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Home View",
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
              )
            ],
          ),
          onTap: () {
            Get.to(TailorHomeView());
          },
        ),
        ListTile(
          title: Row(
            children: <Widget>[
              Icon(
                Icons.person,
                size: 23,
                color: Colors.white70,
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Profile",
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
              )
            ],
          ),
          onTap: () {
            Get.to(TailorProfile());
          },
        ),
        ListTile(
          title: Row(
            children: <Widget>[
              Icon(
                Icons.notifications,
                size: 23,
                color: Colors.white70,
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Notification",
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
              )
            ],
          ),
          onTap: () {
            Get.to(TailorNotification());
          },
        ),
        ListTile(
          title: Row(
            children: <Widget>[
              Icon(
                Icons.fire_truck_outlined,
                size: 23,
                color: Colors.white70,
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Order",
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
              )
            ],
          ),
          onTap: () {
            Get.to(const TOrdersScreen());
          },
        ),
        ListTile(
          title: Row(
            children: <Widget>[
              Icon(
                Icons.settings,
                size: 23,
                color: Colors.white70,
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Settings",
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
              )
            ],
          ),
          onTap: () {
            Get.to(TailorSettingsScreen());
          },
        ),
        ListTile(
          title: Row(
            children: <Widget>[
              Icon(
                Icons.logout,
                size: 23,
                color: Colors.white70,
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Log Out",
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
              )
            ],
          ),
          onTap: () {
            Get.to(AuthPage());
          },
        ),
      ],
    );
  }
}
