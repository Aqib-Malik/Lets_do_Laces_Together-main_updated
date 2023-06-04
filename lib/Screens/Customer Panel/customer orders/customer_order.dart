import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:lets_do_laces_together/Screens/Customer%20Panel/customer%20orders/feedback_screen.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';

class CustomerNotificationScreen extends StatefulWidget {
  @override
  State<CustomerNotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<CustomerNotificationScreen> {
  late Stream<QuerySnapshot> _tailorsStream;

  @override
  void initState() {
    super.initState();
    _tailorsStream = FirebaseFirestore.instance
        .collection('order')
        .where("customer_email",
            isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders Status',
          style: TextStyle(
            color: Color.fromARGB(255, 244, 240, 240),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.backGroundColor,
        elevation: 0,
      ),
      body: SizedBox(
        child: Expanded(
          child: StreamBuilder(
            stream: _tailorsStream,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
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
                    return notificationWidget(
                      item,
                      item['name'],
                      item['name'],
                      item['Gender'] == "female" ? false : true,
                      context,
                    );
                  },
                );
              }
            },
          ),
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
                    width: 250,
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
                name,
                style: TextStyle(
                  color: Color.fromARGB(252, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                FirebaseAuth.instance.currentUser!.email.toString(),
                style: TextStyle(
                  color: NeumorphicTheme.accentColor(context),
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 20.0),
              item["is_rejected"]
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        item["is_rejected"]
                            ? Expanded(
                                child: NeumorphicButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Order Rejected',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: NeumorphicStyle(
                                    color: Color.fromARGB(255, 255, 7, 7),
                                    boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            item["is_completed"]
                                ? Expanded(
                                    child: NeumorphicButton(
                                      onPressed: () {},
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
                                    ),
                                  )
                                : SizedBox(),
                            SizedBox(width: 20.0),
                            item["is_completed"] == false &&
                                    item["is_approve"]
                                ? Expanded(
                                    child: NeumorphicButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Not Completed yet..',
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
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            item["is_completed"] == false &&
                                    item["is_approve"] == false
                                ? Expanded(
                                    child: NeumorphicButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Approval pending....',
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
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                        if (item["is_completed"] == true) // Add this condition
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                NeumorphicButton(
                                  onPressed: () {
                                    Get.to(FeedbackPage(tailorEmail:item['tailor_email']));
                                    // Add feedback logic here
                                  },
                                  child: Text(
                                    'Give Feedback',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: NeumorphicStyle(
                                    color: Colors.blue,
                                    boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                              ],
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
