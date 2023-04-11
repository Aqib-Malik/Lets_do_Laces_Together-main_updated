// ignore_for_file: non_constant_identifier_names, empty_catches, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString name = "Name".obs;
  var email = "".obs;
  var image = "".obs;
    var phone = "".obs;
  var address = "".obs;
  var id = "".obs;
  Map? data;
////fetching data
  fetchdata() {
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection //(teach == false? 'students': 'users');
        ('customer');

    collectionReference
        .doc(FirebaseAuth.instance.currentUser!.email)
        .snapshots()
        .listen((snapshot) {
      data = snapshot.data() as Map?;
      try{
      if (data != null) {
        print(data!['name']);
        // CommonWdget.confirmBox("titlle", data.toString(), () { });
        name.value = data!['name'];
        email.value = data!['email'];
        image.value = data!['img'];
        phone.value = data!['phone'];
        address.value = data!['address'];
        print(image.value);
       } else {
        name.value = "";
        email.value = "";
        image.value = "";
        
        phone.value ="";
        address.value = "";
      }}catch(e){
        print(e.toString());
      }
    });
  }

  @override
  void onInit() async {
    await fetchdata();

    super.onInit();
  }
}
