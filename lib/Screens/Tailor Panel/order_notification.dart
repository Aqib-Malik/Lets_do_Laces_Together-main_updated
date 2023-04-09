import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
    _tailorsStream = FirebaseFirestore.instance.collection('order').snapshots();
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
      // backgroundColor: AppColors.backGroundColor,
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
                List<dynamic> list = snapshot.data?.docs ?? [];
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return notificationWidget(
                      list[index],
                      list[index]['name'],
                      list[index]['tailor_email'],
                      list[index]['Gender'] == "female" ? false : true,
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

  Widget notificationWidget(item,title, email, isMale, context) {
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
                    width: 300,
                    child: Text(
                       title+' (Order Request)',
                      style: TextStyle(
                        color: NeumorphicTheme.baseColor(context),
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                           
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
                'Email:',
                style: TextStyle(
                  color: Color.fromARGB(252, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                email,
                style: TextStyle(
                  color: NeumorphicTheme.accentColor(context),
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: NeumorphicButton(
                      onPressed: () {
                        // FirebaseFirestore.instance.collection("order")
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
                    child: NeumorphicButton(
                      onPressed: () {},
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
