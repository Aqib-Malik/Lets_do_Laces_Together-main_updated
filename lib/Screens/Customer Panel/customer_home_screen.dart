import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lets_do_laces_together/Controller/auth_controller.dart';
import 'package:lets_do_laces_together/Screens/Customer%20Panel/Customer_Add_Cart/add_to_cart_view.dart';
import 'package:lets_do_laces_together/Screens/Customer%20Panel/Customer_Drawer/customer_drawer.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';
import '../../Utils/AppImages/app_images.dart';
import 'Categories/categories.dart';
import 'Product picking firebase/Genst Product/gents_list_product.dart';
import 'Product picking firebase/Ledies Product/ladies_listView.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  bool Grid = true;
    final authController = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      drawer: Drawer(
        backgroundColor: Colors.black.withOpacity(0.5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
        ),
        child: const CustomerDrawerScreen(),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.pink.shade400,
        elevation: 3,
        title: const Text(
          "Home",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Get.to(const AddToCartScreen());
        //       },
        //       icon: Icon(
        //         Icons.favorite,
        //         color: Colors.white,
        //         size: 30.sp,
        //       )),
        //   const SizedBox(
        //     width: 10,
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
               StreamBuilder<DocumentSnapshot>(
  stream: FirebaseFirestore.instance.collection('customer').doc(FirebaseAuth.instance.currentUser!.email).snapshots(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      var name = snapshot.data!['name'];
      return Text(
        'Hello $name',
        style: TextStyle(fontSize: 20, color: Colors.white),
      );
    }
    return Text('Loading...');
  },
),
              const Text(
                'Find your nearby tailor,',
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Categories',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        Grid = true;
                      });
                    },
                    child: CategoriesCard(
                      color: Grid
                          ? const Color.fromARGB(255, 253, 152, 0)
                          : Colors.white,
                      img: Image.asset(AppImages.categoryLadies),
                      title: 'Women',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Grid = false;
                      });
                    },
                    child: CategoriesCard(
                      color: !Grid
                          ? const Color.fromARGB(255, 253, 152, 0)
                          : Colors.white,
                      img: Image.asset(AppImages.categoryGent),
                      title: 'Gents',
                    ),
                  ),
                ],
              ),
              Grid
                  ? const LadiesListViewShowingCustomerPanel()
                  : const GentsListViewShowingCustomerPanel(),
            ],
          ),
        ),
      ),
    );
  }
}
