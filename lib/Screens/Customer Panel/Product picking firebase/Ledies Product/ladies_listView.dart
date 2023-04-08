import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lets_do_laces_together/Controller/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Utils/AppColors/app_colors.dart';
import '../../../Tailor Panel/Model/controller/controller.dart';

class LadiesListViewShowingCustomerPanel extends StatefulWidget {
  const LadiesListViewShowingCustomerPanel({super.key});

  @override
  State<LadiesListViewShowingCustomerPanel> createState() =>
      _LadiesGridViewState();
}

final LadiesCardController _LadiesCardController = LadiesCardController();

class _LadiesGridViewState extends State<LadiesListViewShowingCustomerPanel> {
  // final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Expanded(
        child:  StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Posts').snapshots(),//authController.ref.onValue,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else {
              print(snapshot.data?.docs );
              // Map<dynamic, dynamic> map =
              //     snapshot.data?.snapshot.value as dynamic;
              List<dynamic> list = [];
              list.clear();
              list = snapshot.data?.docs ?? [];//map.values.toList();
             list.removeWhere((item) => item['type'] == 'Gents');
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onDoubleTap: () {
                                  Get.defaultDialog(
                                      title: "Image",
                                      content: Text(
                                        list[index]['product_name'].toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                      actions: [
                                        SizedBox(
                                          width: double.infinity,
                                          height: Get.height * 0.3,
                                          child: Image.network(
                                            list[index]['imgUrl'],
                                            fit: BoxFit.contain,
                                          ),
                                        )
                                      ]);
                                },
                                child: SizedBox(
                                    height: 200.h,
                                    width: 150.w,
                                    child: Image.network(
                                      list[index]['imgUrl'],
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              const SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    list[index]['product_name'].toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    "Rs : ${list[index]['product_price']}/-",
                                    style: TextStyle(
                                        color: AppColors.backGroundColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 3),
                                  const Text(
                                    'Description:',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                      width: 170.w,
                                      child: Text(
                                        list[index]['product_description']
                                            .toString(),
                                        style:
                                            const TextStyle(color: Colors.grey),
                                        textAlign: TextAlign.justify,
                                      )),
                                ],
                              )
                            ],
                          ),
                          const Divider(
                            thickness: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Shop Name: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      list[index]['shopName'].toString(),
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Tailer Name: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      list[index]['tailerName'].toString(),
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Shop Address: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      list[index]["shopAddress"].toString(),
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'City: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      list[index]["city"].toString(),
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Delivery Name: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      list[index]["deliveryName"].toString(),
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Phone Number: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      list[index]["deliveryPhone"].toString(),
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Whatsapp Contact ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                InkWell(
                                  onTap: () async {
                                    final phone =
                                        "+92${list[index]["tailerPhone"].toString()}";
                                    await launch(
                                        "https://wa.me/$phone?text=Hello");
                                    // print(
                                    //     "phone${list[index]["tailerPhone"].toString()}");
                                    // final message =
                                    //     'Hello, I am interested in this product.'; // Replace with your message
                                    // final url =
                                    //     'https://wa.me/$phone?text=${Uri.encodeFull(message)}';
                                    // // ignore: deprecated_member_use
                                    // if (await canLaunch(url)) {
                                    //   // ignore: deprecated_member_use
                                    //   await launch(url);
                                    // } else {
                                    //   throw 'Could not launch $url';
                                    // }
                                  },
                                  child:  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.phone,
                                      size: 30,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ));
                    });
              }
            }),
      ),
    );
  }
}
