import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lets_do_laces_together/Screens/Customer%20Panel/customer%20orders/customer_order.dart';
import 'package:lets_do_laces_together/Screens/Customer%20Panel/my_controller.dart';
import 'package:lets_do_laces_together/Screens/brand_panel/brands.dart';
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
  HomeController hcontroller=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Column(
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
                    backgroundImage:  NetworkImage(hcontroller.image.value.toString()),
                  )),
              SizedBox(
                width: 7.w,
              ),
               Text(
                hcontroller.name.value.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
               Text(
                hcontroller.email.value.toString(),
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
          // ListTile(
          //   title: Row(
          //     children: const <Widget>[
          //       Icon(
          //         Icons.fire_truck_outlined,
          //         size: 23,
          //         color: Colors.white,
          //       ),
          //       SizedBox(
          //         width: 10,
          //       ),
          //       Padding(
          //         padding: EdgeInsets.only(left: 8.0),
          //         child: Text(
          //           "Favorite",
          //           style: TextStyle(color: Colors.white, fontSize: 20),
          //         ),
          //       )
          //     ],
          //   ),
          //   onTap: () {
          //     Get.to(const AddToCartScreen());
          //   },
          // ),
          ListTile(
                    title: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.badge_rounded,
                          size: 23,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "All Brand",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      Get.to(BrandScreen());
                    },
                  ),
          ListTile(
                    title: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.notification_important,
                          size: 23,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "My Orders",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      Get.to(CustomerNotificationScreen(
                      ));
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
      ),
    );
  }
}
