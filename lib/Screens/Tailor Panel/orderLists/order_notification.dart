import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:lets_do_laces_together/Screens/Tailor%20Panel/orderLists/order_detail.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late Stream<QuerySnapshot> _tailorsStream;

  @override
  void initState() {
    super.initState();
    _tailorsStream = FirebaseFirestore.instance.collection('order').where("tailor_email",isEqualTo: FirebaseAuth.instance.currentUser!.email).where("is_rejected",isEqualTo: false).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders Notifications',
          style: TextStyle(
            color: Color.fromARGB(255, 244, 240, 240),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.backGroundColor,
        elevation: 0,
      ),
      body: Container(
        height: Get.height,
        child: StreamBuilder(
          stream: _tailorsStream,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return  Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.size,
                itemBuilder: (context, index) {
                  final item = snapshot.data!.docs[index];
                  return InkWell(
                    onTap: (){
                      Get.to(
                        DetailPage(
                neckSize: item['neckSize'],
                chestSize: item['chestSize'],
                waistSize: item['waistSize'],
                hipSize: item['hipSize'],
                inseamLength: item['inseamLength'],
                // tailorEmail: item['tailorEmail'],
                gender: item['Gender'],
                customerEmail: item['customer_email'],
                customerImage: item['customer_image'],
                customerName: item['customer_name'],
                customerAddress: item['customer_address'],
                customerPhone: item['customer_phone'],
              ),
                      );
                      
                    },
                    child: notificationWidget(
                      item,
                      item['name'],
                      item['name'],
                      item['Gender'] == "female" ? false : true,
                      context,
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget notificationWidget(item, title, name, isMale, context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          depth: 8,
          intensity: 0.5,
          lightSource: LightSource.topLeft,
          color: Colors.white,
        ),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 33, 33, 33),
                Color(0xff373737),
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    child: Text(
                      title + ' (Order Request)',
                      style: TextStyle(
                        color: NeumorphicTheme.baseColor(context),
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  NeumorphicIcon(
                    isMale ? Icons.male : Icons.female,
                    size: 40.0,
                    style: NeumorphicStyle(
                      color: NeumorphicTheme.baseColor(context),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                'Name:',
                style: TextStyle(
                  color: Color.fromARGB(252, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                name,
                style: TextStyle(
                  color: NeumorphicTheme.accentColor(context),
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 20.0),
              item["is_completed"]?Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child:
                    NeumorphicButton(
                      onPressed: () {
                       
                      },
                      child: Text(
                        'Order Completed',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: NeumorphicStyle(
                        color: Colors.amber,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(30.0),
                        ),
                      ),
                    )
                  ),
                ],
              ):
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child:
                    item["is_approve"]? NeumorphicButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection("order")
                            .doc(item.id)
                            .update({"is_completed": true}).whenComplete(() {
                          Get.snackbar(
                            'Completed',
                            'order completed',
                            icon: const Icon(Icons.notifications_active,
                                color: Colors.green),
                            snackPosition: SnackPosition.TOP,
                          );
                        });
                      },
                      child: Text(
                        'Completed',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: NeumorphicStyle(
                        color: Colors.amber,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(30.0),
                        ),
                      ),
                    ):
                     NeumorphicButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection("order")
                            .doc(item.id)
                            .update({
                              "is_rejected":true
                            })
                            .whenComplete(() {
                          Get.snackbar(
                            'Rejected',
                            'order rejected',
                            icon: const Icon(Icons.notifications_active,
                                color: Colors.green),
                            snackPosition: SnackPosition.TOP,
                          );
                        });
                      },
                      child: Text(
                        'REJECT',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      style: NeumorphicStyle(
                        color: Colors.white,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child:item["is_approve"]? NeumorphicButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection("order")
                            .doc(item.id)
                            .update({"is_approve": true}).whenComplete(() {
                          Get.snackbar(
                            'Aproved',
                            'order aproved',
                            icon: const Icon(Icons.notifications_active,
                                color: Colors.green),
                            snackPosition: SnackPosition.TOP,
                          );
                        });
                      },
                      child: Text(
                        'Pending',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: NeumorphicStyle(
                        color: Color.fromARGB(255, 47, 255, 0),
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(30.0),
                        ),
                      ),
                    ):
                     NeumorphicButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection("order")
                            .doc(item.id)
                            .update({"is_approve": true}).whenComplete(() {
                          Get.snackbar(
                            'Aproved',
                            'order aproved',
                            icon: const Icon(Icons.notifications_active,
                                color: Colors.green),
                            snackPosition: SnackPosition.TOP,
                          );
                        });
                      },
                      child: Text(
                        'APPROVE',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: NeumorphicStyle(
                        color: Color(0xff00BFFF),
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
