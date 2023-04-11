import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';

class TailorsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        title: Text('Tailors List',style: TextStyle(color: Colors.white),),
      ),
      body: StreamBuilder<QuerySnapshot>(
        // Step 2: Create a stream that listens to the user collection in Firestore
        stream: FirebaseFirestore.instance.collection('shop').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // Step 3: Create a ListView.builder to display the user records
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot user = snapshot.data!.docs[index];
              return
  userWidget(user['name'],user['email'],user['imgUrl'],user['phone'],user['city']);
              //  ListTile(
              //   title: Text(user['name']),
              //   subtitle: Text(user['email']),
              // );
            },
          );
        },
      ),
    );
  }


  userWidget(name,email,image,phone,location){
    return Neumorphic(
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(12),
              ),
              depth: 5,
              intensity: 0.8, // changed intensity to 0.8
              color: Colors.white,
              shape: NeumorphicShape.flat, // added flat shape
            ),
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // updated margin
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(image),
              ),
              title: Text(name),
              subtitle: Text(location),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                   

                    children: [
                      Text(email),
                      SizedBox(height: 4),
                      Text(phone),
                    ],
                  ),
                ],
              ),
            ),
          );

  }



}
