import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';
import '../../../Controller/auth_controller.dart';

class CustomerProfileView extends StatefulWidget {
  final String? uid;
  const CustomerProfileView({Key? key, this.uid}) : super(key: key);

  @override
  State<CustomerProfileView> createState() => _CustomerProfileViewState();
}

class _CustomerProfileViewState extends State<CustomerProfileView> {
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: StreamBuilder(
          stream: authController.customer
              .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            final List<DocumentSnapshot> data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 230,
                          width: double.infinity,
                          color: AppColors.backGroundColor,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 15, bottom: 100),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "PROFILE",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            top: 160,
                            left: 30,
                            child: SizedBox(
                              height: 140,
                              width: 300,
                              child: Card(
                                  elevation: 1,
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 18.h),
                                      Text(
                                        data[index]['name'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black45),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                    ],
                                  )),
                            )),
                        Positioned(
                          top: 115,
                          left: 130,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(data[index]['img']),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Card(
                        elevation: 2,
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  ...ListTile.divideTiles(
                                    color: Colors.grey,
                                    tiles: [
                                      ListTile(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 4),
                                        leading: const Icon(Icons.person),
                                        title: const Text(
                                          "Name",
                                          style:
                                              TextStyle(color: Colors.black45),
                                        ),
                                        subtitle: Text(
                                          data[index]['name'],
                                          style: const TextStyle(
                                              color: Colors.black54),
                                        ),
                                      ),
                                      ListTile(
                                        leading: const Icon(Icons.email),
                                        title: const Text(
                                          "Email",
                                          style:
                                              TextStyle(color: Colors.black54),
                                        ),
                                        subtitle: Text(
                                          data[index]['email'],
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black54),
                                        ),
                                      ),
                                      ListTile(
                                        leading: const Icon(Icons.phone),
                                        title: const Text(
                                          "Phone",
                                          style:
                                              TextStyle(color: Colors.black54),
                                        ),
                                        subtitle: Text(
                                          data[index]['phone'],
                                          style: const TextStyle(
                                              color: Colors.black54),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          }),
    );
  }
}
