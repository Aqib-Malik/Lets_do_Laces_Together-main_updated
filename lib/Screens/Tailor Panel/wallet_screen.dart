import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';

class WalletScreen extends StatefulWidget {
  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  double totalEarnings = 5000.0;
  var totalOrders = 0;
  final CollectionReference customerCollection =
      FirebaseFirestore.instance.collection('order');

  Future<int> countDocuments(CollectionReference collection, String email) async {
    QuerySnapshot snapshot =
        await collection.where('tailor_email', isEqualTo: email).get();
    int count = snapshot.size;
    return count;
  }

  void setData() async {
    String currentUserEmail =
        FirebaseAuth.instance.currentUser?.email ?? '';
    int orderCount = await countDocuments(customerCollection, currentUserEmail);

    QuerySnapshot snapshot = await customerCollection
        .where('tailor_email', isEqualTo: currentUserEmail)
        .get();
    var rat = snapshot.docs.isNotEmpty
        ? (snapshot.docs.first.data() as Map<String, dynamic>)['rate'] ?? 0.0
        : 0.0;
    var rate = double.parse(rat);
    setState(() {
      totalOrders = orderCount;
      totalEarnings = rate;
    });
  }

  @override
  void initState() {
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        title: Text('Earnings and Orders'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Total Orders & Earnings',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          offset: Offset(0, 4),
                          blurRadius: 8.0,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Icon(
                          FlutterIcons.shop_mdi,
                          color: Colors.white,
                          size: 48.0,
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          (totalOrders*totalEarnings).toString()+' Pkr',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Total Earning',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.3),
                          offset: Offset(0, 4),
                          blurRadius: 8.0,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Icon(
                          FlutterIcons.check_fea,
                          color: Colors.white,
                          size: 48.0,
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          totalOrders.toString(),
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Total orders',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),)
    );
  }
}
