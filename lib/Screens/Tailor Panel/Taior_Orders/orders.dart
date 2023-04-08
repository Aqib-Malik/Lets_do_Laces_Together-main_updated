import 'package:flutter/material.dart';
import 'package:lets_do_laces_together/Screens/Tailor%20Panel/Taior_Orders/serch_field.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';

import 'custom_tabbar.dart';

class TOrdersScreen extends StatefulWidget {
  const TOrdersScreen({Key? key}) : super(key: key);

  @override
  State<TOrdersScreen> createState() => _TOrdersScreenState();
}

class _TOrdersScreenState extends State<TOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColors.backGroundColor,
        title: Text(
          'Orders Details',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Active Orders",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.backGroundColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "3",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black38),
                            )
                          ],
                        ),
                      )),
                ),
                Expanded(
                  child: SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Payment This Week",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.backGroundColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "0",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black38),
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          const Expanded(
            flex: 3,
            child: CustomTabBar(),
          )
        ],
      ),
    );
  }
}
