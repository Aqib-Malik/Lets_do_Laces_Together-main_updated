import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:lets_do_laces_together/Screens/Tailor%20Panel/view/gents_card.dart';
import '../../Utils/AppColors/app_colors.dart';
import 'Taior_Orders/upload_product.dart';
import 'darwer.dart';
import 'view/ladies_card.dart';

class TailorHomeView extends StatefulWidget {
  @override
  _TabBarViewState createState() => _TabBarViewState();
}

class _TabBarViewState extends State<TailorHomeView>
    with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPOp = await showWarning(context);
        return shouldPOp;
      },
      child: Scaffold(
        backgroundColor: Colors.pink.shade300,
        drawer: Drawer(
          width: double.infinity,
          backgroundColor: AppColors.backGroundColor.withOpacity(0.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
          ),
          child: Container(
            width: Get.width/1.4,
            child: CustomDrawer(
              uid: FirebaseAuth.instance.currentUser?.uid,
            ),
          ),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppColors.backGroundColor,
          title: const Text(
            'Home View',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              Container(
                color: AppColors.backGroundColor,
                constraints: const BoxConstraints.expand(
                  height: 50,
                ),
                child: const TabBar(
                  tabs: [
                    Tab(
                      text: "Ladie's",
                    ),
                    Tab(
                      text: "Gent's",
                    ),
                  ],
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  labelStyle:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(fontSize: 16),
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3,
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  // Ladies Tab bar
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: Column(
                      children: [
                        LadiesCard(),
                      ],
                    ),
                  ),
                  // Gents Tab Bar
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: Column(
                      children: [
                        GentsCard(),
                      ],
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          onPressed: () {
            Get.to(UploadProduct(
              uid: FirebaseAuth.instance.currentUser!.uid,
            ));
            // Add your onPressed code here!
          },
          backgroundColor: AppColors.backGroundColor,
          child: const Icon(
            Icons.add,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
