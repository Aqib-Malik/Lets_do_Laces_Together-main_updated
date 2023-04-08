import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';

import 'order_details.dart';
import 'order_model.dart';

class OrderRequestCard extends StatefulWidget {
  const OrderRequestCard({Key? key}) : super(key: key);

  @override
  State<OrderRequestCard> createState() => _OrderRequestCardState();
}

class _OrderRequestCardState extends State<OrderRequestCard> {
  final _DataController = DataController();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _DataController.modelData.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.to(OrderDetails());
                },
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Card(
                    elevation: 1,
                    color: Colors.blue[50],
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Order',
                                    style: TextStyle(
                                        color: AppColors.backGroundColor),
                                  ),
                                  Text(
                                    _DataController.modelData[index].orderNum
                                        .toString(),
                                    style: TextStyle(
                                        color: AppColors.backGroundColor),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    _DataController.modelData[index].item
                                        .toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Item',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                                _DataController.modelData[index].img.toString(),
                                height: 100),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_DataController.modelData[index].name
                                    .toString()),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(_DataController.modelData[index].itemName
                                    .toString()),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Text('Due '),
                                    Text(_DataController.modelData[index].date
                                        .toString()),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Text('Amount '),
                                    Text(_DataController.modelData[index].amount
                                        .toString()),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),

                                //end
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 40.h,
                              width: 90.w,
                              child: TextButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: AppColors.backGroundColor,
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
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                              width: 90.w,
                              child: TextButton(
                                onPressed: () {
                                  // Get.to(PandingScreen[index==2]);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green[300],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: const BorderSide(
                                        color: Colors.transparent,
                                      )),
                                  // elevation: 15.0,
                                ),
                                child: const Center(
                                    child: Text(
                                  'Accept',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
