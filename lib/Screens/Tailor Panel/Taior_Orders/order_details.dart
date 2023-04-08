import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../Utils/AppColors/app_colors.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 1,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Order #8483',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 25, top: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Status',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Text(
                    'Mobile No.',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Not Accepted Yet',
                  ),
                  Text(
                    '+92331936207',
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Text(
                    'Amount Received',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Syed Sadan Ali',
                  ),
                  Text(
                    'None',
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Stitching Type',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Text(
                    'Amount Due',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Alteration',
                  ),
                  Text(
                    '1000',
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order Received',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Text(
                    'Fabric Provided',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '02th Jan 2023',
                  ),
                  Text(
                    'None',
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order Due',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Text(
                    'Location',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '26th Jan 2023',
                  ),
                  Text(
                    'F-6/1 Street #12 House#214',
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cloth',
                    style: TextStyle(color: Colors.red[300]),
                  ),
                  Text(
                    'Pattern',
                    style: TextStyle(color: Colors.red[300]),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: Card(
                      elevation: 5,
                      child: Image.asset(
                          'assets/images/TailorImages/DressShirt.png'),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Card(
                      elevation: 5,
                      child: Image.asset(
                          'assets/images/TailorImages/DressShirt.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60, right: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40.h,
                      width: 90.w,
                      child: TextButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[300],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                color: Colors.transparent,
                              )),
                          // elevation: 15.0,
                        ),
                        child: Center(
                            child: Text(
                          'Reject',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                      width: 90.w,
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                color: Colors.transparent,
                              )),
                          // elevation: 15.0,
                        ),
                        child: Center(
                            child: Text(
                          'Accept',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
