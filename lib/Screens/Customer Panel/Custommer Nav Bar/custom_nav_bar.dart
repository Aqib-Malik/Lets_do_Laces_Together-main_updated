import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lets_do_laces_together/Screens/Customer%20Panel/Customer_profile/customer_profile_screen.dart';
import 'package:lets_do_laces_together/Screens/Customer%20Panel/tailor_list.dart/tailor_list.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../customer_home_screen.dart';


class CustommerBottomNavBar extends StatefulWidget {
  const CustommerBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustommerBottomNavBar> createState() => _CustommerBottomNavBarState();
}

class _CustommerBottomNavBarState extends State<CustommerBottomNavBar> {
  final controller = PersistentTabController(initialIndex: 0);

  Future<bool> showWarning(BuildContext context) async => await showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    "Do You Really Want to Exit the App?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: AppColors.backGroundColor,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                              ),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                              ),
                              child: const Text(
                                "Confirm",
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ));

  List<Widget> _screens() {
    return [
      const CustomerHomeScreen(),
      TailorList(),
      CustomerProfileView(uid: FirebaseAuth.instance.currentUser?.uid),
    ];
  }

  List<PersistentBottomNavBarItem> _navbarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_outlined),
        activeColorPrimary: Colors.white,
        inactiveIcon: Icon(Icons.home, color: Colors.grey.shade100),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.people_alt_outlined),
        activeColorPrimary: Colors.white,
        inactiveIcon: Icon(Icons.people, color: Colors.grey.shade100),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_outline),
        activeColorPrimary: Colors.white,
        inactiveIcon: Icon(Icons.person, color: Colors.grey.shade100),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPOp = await showWarning(context);
        return shouldPOp;
      },
      child: PersistentTabView(
        context,
        controller: controller,
        screens: _screens(),
        items: _navbarItems(),
        backgroundColor: AppColors.backGroundColor,
        navBarStyle: NavBarStyle.style14,
        decoration: NavBarDecoration(borderRadius: BorderRadius.circular(1)),
      ),
    );
  }
}
