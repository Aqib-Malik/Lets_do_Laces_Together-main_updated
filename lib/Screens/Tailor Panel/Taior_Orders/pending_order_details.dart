import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../Utils/AppColors/app_colors.dart';

class PendingOrderDetails extends StatefulWidget {
  const PendingOrderDetails({Key? key}) : super(key: key);

  @override
  State<PendingOrderDetails> createState() => _PendingOrderDetailsState();
}

class _PendingOrderDetailsState extends State<PendingOrderDetails> {
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
          'Order Details',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 25, top: 25),
          child: Column(
            children: [
              Text(
                'Order #3884',
                style: TextStyle(fontSize: 20, color: Colors.red[300]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Name',
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
                    'Tooba',
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
                    'Type',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Text(
                    'Stitching Type',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dress Shirt',
                  ),
                  Text(
                    'Alteration',
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
                    'Status',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  // Text('Amount Due',style: TextStyle(fontSize: 15,color: Colors.white),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'In Progress',
                  ),
                  // Text('1000',),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(PendingOrderDetails());
                    },
                    child: SizedBox(
                      height: 210,
                      width: double.infinity,
                      child: Card(
                          elevation: 1,
                          color: Colors.blue[50],
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            'Order ',
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            '#3884',
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        child: Row(
                                      children: [
                                        Text(
                                          '5',
                                          style: TextStyle(
                                              color: Colors.red[300],
                                              fontSize: 20),
                                        ),
                                        Text(
                                          ' Days Left',
                                          style: TextStyle(
                                              color: Colors.red[300],
                                              fontSize: 20),
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 2, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            'Amount Due',
                                            style: TextStyle(fontSize: 13),
                                          ),
                                          Text(
                                            "1000",
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        child: Row(
                                      children: [
                                        Text(
                                          "5th Jun 2023",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 130,
                                        width: 130,
                                        child: Image.asset(
                                            "assets/images/TailorImages/DressShirt.png"),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Syed Sadan Ali",
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Dress Shirt",
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        children: [
                                          Text("1"),
                                          Text(' Item'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 40.h,
                                        width: 180.w,
                                        child: TextButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            // primary: Colors.red[300],

                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                side: BorderSide(
                                                  color: Colors.black38,
                                                )),
                                            // elevation: 15.0,
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(Icons.watch_later_outlined),
                                              SizedBox(
                                                width: 1,
                                              ),
                                              Text(
                                                'Work in Progress',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
