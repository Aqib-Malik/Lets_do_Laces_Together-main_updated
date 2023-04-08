import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBottomsheet {
  String Txt="abc";
  double hght = 1.0;
  double wdth = 1.0;
  CustomBottomsheet({
    required this.Txt,
    required this.hght,
    required this.wdth,
  });
  void cfxn(BuildContext context, VoidCallbackAction ontap) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            SizedBox(
              height: 260.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 2.h,
                      width: 38.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.shopping_cart_sharp,
                        size: 25.sp,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 13.3.w,
                      ),
                      Text(
                        'Cart',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          fontFamily: 'Lato',
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Product Name',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      fontFamily: 'Lato',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Text(
                        '5590',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            fontFamily: 'Lato',
                            decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        '5590',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          fontFamily: 'Lato',
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Product Cost',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            fontFamily: 'Lato',
                            color: Colors.black),
                      ),
                      Spacer(),
                      Text(
                        '₹ 200.00',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            fontFamily: 'Lato',
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Service Cost',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            fontFamily: 'Lato',
                            color: Colors.black),
                      ),
                      Spacer(),
                      Text(
                        '₹ 1.50',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            fontFamily: 'Lato',
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 13.h,
                          ),
                          Text(
                            'Total',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                fontFamily: 'Lato',
                                color: Colors.black),
                          ),
                          Text(
                            '₹ 201.50',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                fontFamily: 'Lato',
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
