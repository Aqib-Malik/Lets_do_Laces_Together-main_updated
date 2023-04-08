import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_do_laces_together/Screens/profile_edit.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';
import '../../Controller/auth_controller.dart';

class TailorProfile extends StatelessWidget {
  final String? uid;
  TailorProfile({Key? key, this.uid}) : super(key: key);
  final authController = Get.put(AuthController());
  CollectionReference users = FirebaseFirestore.instance.collection('shop');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.backGroundColor,
      ),
      extendBody: true,
      body: SizedBox.expand(
        child: StreamBuilder<QuerySnapshot>(
          stream: users
              .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            final List<DocumentSnapshot> data = snapshot.data!.docs;
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else {
              return ListView.separated(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ProfileHeader(
                        avatar: NetworkImage(data[index]['imgUrl']),
                        coverImage: NetworkImage(data[index]['imgUrl']),
                        title: data[index]['name'],
                        subtitle: data[index]['email'],
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 4.0),
                              alignment: Alignment.topLeft,
                              child: const Text(
                                "User Information",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Card(
                              child: Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: <Widget>[
                                    ...ListTile.divideTiles(
                                      color: Colors.grey,
                                      tiles: [
                                        ListTile(
                                          // onTap: (){
                                          //    users.doc(snapshot.data!.docs[index]['id'].toString()).update({});
                                          // },
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12, vertical: 4),
                                          leading:
                                              const Icon(Icons.my_location),
                                          title: const Text("Location"),
                                          subtitle: Text(data[index]['shop']),
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.email),
                                          title: const Text("Email"),
                                          subtitle: Text(data[index]['email']),
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.phone),
                                          title: const Text("Phone"),
                                          subtitle: Text(data[index]['phone']),
                                        ),
                                        ListTile(
                                          leading: const Icon(
                                              Icons.home_work_rounded),
                                          title: const Text("Shop Name"),
                                          subtitle: Text(data[index]['name']),
                                        ),
                                        ListTile(
                                          leading:
                                              const Icon(Icons.location_pin),
                                          title: const Text("City"),
                                          subtitle: Text(data[index]['city']),
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.person),
                                          title: const Text("About Me"),
                                          subtitle: Text(data[index]['about']),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 100,
                                              color: AppColors.backGroundColor,
                                              child: TextButton(
                                                child: const Text(
                                                  "Edit",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 18),
                                                ),
                                                onPressed: () {
                                                  Get.to(
                                                    ProfileEditScreen(
                                                      img: data[index]
                                                          ['imgUrl'],
                                                      city: data[index]['city'],
                                                      name: data[index]['name'],
                                                      phoneNumber: data[index]
                                                          ['phone'],
                                                      aboutMe: data[index]
                                                          ['about'],
                                                      shopAddress: data[index]
                                                          ['shop'],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Container();
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final ImageProvider<dynamic> coverImage;
  final ImageProvider<dynamic> avatar;
  final String title;
  final String? subtitle;
  final List<Widget>? actions;

  const ProfileHeader(
      {Key? key,
      required this.coverImage,
      required this.avatar,
      required this.title,
      this.subtitle,
      this.actions})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Ink(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: coverImage as ImageProvider<Object>, fit: BoxFit.cover),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 160),
          child: Column(
            children: <Widget>[
              Avatar(
                image: avatar,
                radius: 40,
                backgroundColor: Colors.white,
                borderColor: Colors.grey.shade300,
                borderWidth: 4.0,
              ),
              Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              if (subtitle != null) ...[
                const SizedBox(height: 5.0),
                Text(
                  subtitle!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ]
            ],
          ),
        )
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  final ImageProvider<dynamic> image;
  final Color borderColor;
  final Color? backgroundColor;
  final double radius;
  final double borderWidth;

  const Avatar(
      {Key? key,
      required this.image,
      this.borderColor = Colors.grey,
      this.backgroundColor,
      this.radius = 30,
      this.borderWidth = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius + borderWidth,
      backgroundColor: borderColor,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        child: CircleAvatar(
          radius: radius - borderWidth,
          backgroundImage: image as ImageProvider<Object>?,
        ),
      ),
    );
  }
}
