import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lets_do_laces_together/Screens/Admin%20Panel/order_lists.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';
import 'package:lets_do_laces_together/Views/users/customer_list.dart';
import 'package:lets_do_laces_together/Views/users/tailor_list.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int coustomers=0;
  int tailors=0;
  final CollectionReference customerCollection = FirebaseFirestore.instance.collection('customer');
  final CollectionReference tailorCollection = FirebaseFirestore.instance.collection('shop');

  Future<int> countDocuments(CollectionReference collection) async {
  QuerySnapshot snapshot = await collection.get();
  int count = snapshot.size;
  return count;
}

setdata()async{
  await countDocuments(customerCollection).then((value) async{
   setState(() {
      coustomers=value;
   });
 await countDocuments(tailorCollection).then((nesvalue) {
   setState(() {
      tailors=nesvalue;
   });

   
    

  });


    

  });
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.backGroundColor,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Dashboard',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
      backgroundColor: AppColors.backGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.to(TailorsList());
                      },
                      child: SizedBox(
                        height: 160,
                        width: 160,
                        child: Card(
                          elevation: 2,
                          color: Colors.blue[300],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:  [
                              Text(
                                '+'+tailors.toString(),
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Tailors',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black38),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(CustomerList());
                      },
                      child: SizedBox(
                        height: 160,
                        width: 160,
                        child: Card(
                          elevation: 2,
                          color: Colors.green[300],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:  [
                              Text(
                                '+'+coustomers.toString(),
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Customer',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black38),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.to(OrderListScreen());
                      },
                      child: SizedBox(
                        height: 160,
                        width: 160,
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          color: Colors.orange[300],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.shop,
                                size: 50,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: const [
                                    Text(
                                      'Orders',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      width: 160,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        color: Colors.blueGrey[300],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.warning,
                              size: 50,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 19),
                              child: Row(
                                children: const [
                                  Text(
                                    'Pending Requests:',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '6',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                maxRadius: 25,
                                backgroundColor: Colors.grey[300],
                                child: const Icon(
                                  Icons.manage_accounts,
                                  size: 30,
                                  color: Colors.lightBlue,
                                ),
                              ),
                              const Text('Customers')
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                maxRadius: 25,
                                backgroundColor: Colors.grey[300],
                                child: const Icon(
                                  Icons.person,
                                  size: 30,
                                  color: Colors.lightBlue,
                                ),
                              ),
                              const Text('Complains')
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                maxRadius: 25,
                                backgroundColor: Colors.grey[300],
                                child: const Icon(
                                  Icons.supervisor_account,
                                  size: 30,
                                  color: Colors.lightBlue,
                                ),
                              ),
                              const Text('Earnings')
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                maxRadius: 25,
                                backgroundColor: Colors.grey[300],
                                child: const Icon(
                                  Icons.manage_accounts,
                                  size: 30,
                                  color: Colors.lightBlue,
                                ),
                              ),
                              const Text('Blocked')
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
