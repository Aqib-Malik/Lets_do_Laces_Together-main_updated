import 'package:flutter/material.dart';
import 'package:lets_do_laces_together/Views/Tailor%20Panel/Taior_Orders/panding_screen.dart';

import '../../../Screens/Tailor Panel/Taior_Orders/order_deliverd.dart';
import '../../../Screens/Tailor Panel/Taior_Orders/order_request.dart';
import '../../../Screens/Tailor Panel/Taior_Orders/out_for_delivery.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                  // color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.0)),
              child: TabBar(
                isScrollable: true,
                indicator: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(25.0),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(
                    text: 'Order Request',
                  ),
                  Tab(
                    text: 'In Progress',
                  ),
                  Tab(
                    text: 'Completed',
                  ),
                  Tab(
                    text: 'Delivered',
                  ),
                ],
              ),
            ),
            const Expanded(
                child: TabBarView(
              children: [
                // Order Screen
                OrderRequestCard(),
                //Pending Screen
                PandingScreen(),
                // Order Complete Screen
                OutOfDelivery(),
                // Order Completed
                OderDeliverd(),
              ],
            ))
          ],
        ),
      )),
    );
  }
}
