import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';
import 'package:lets_do_laces_together/Utils/AppImages/app_images.dart';
import 'package:lets_do_laces_together/auth_page.dart';

import '../Customer_Add_Cart/add_to_cart_view.dart';

class CustomerDrawerScreen extends StatefulWidget {
  const CustomerDrawerScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomerDrawerScreen> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomerDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Column(
          children: [
            SizedBox(
              width: 20.w,
            ),
            CircleAvatar(
                radius: 55,
                backgroundColor: Colors.pink.shade100,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.backGroundColor,
                  backgroundImage: const AssetImage(AppImages.categoryLadies),
                )),
            SizedBox(
              width: 7.w,
            ),
            const Text(
              "Aneeqa Shfaq",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "aneeqaashfaq456@gmail.com",
              style: TextStyle(
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
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Row(
            children: const <Widget>[
              Icon(
                Icons.fire_truck_outlined,
                size: 23,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Favorite",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          ),
          onTap: () {
            Get.to(const AddToCartScreen());
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
            Get.offAll(const AuthPage());
          },
        ),
      ],
    );
  }
}
