import 'dart:ui';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_do_laces_together/Controller/auth_controller.dart';
import 'package:lets_do_laces_together/Screens/Tailor%20Panel/view/tailer_data_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../Utils/AppColors/app_colors.dart';
import '../Model/controller/controller.dart';

class GentsCard extends StatefulWidget {
  GentsCard({Key? key}) : super(key: key);

  @override
  State<GentsCard> createState() => _GentsCardState();
}

class _GentsCardState extends State<GentsCard> {
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Posts').snapshots(),//authController.ref.onValue,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else {
              print(snapshot.data?.docs );
              // Map<dynamic, dynamic> map =
              //     snapshot.data?.snapshot.value as dynamic;
              List<dynamic> list = [];
              list.clear();
              list = snapshot.data?.docs ?? [];//map.values.toList();
              list.removeWhere((item) => item['type'] == 'Ladies');
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    childAspectRatio: (150 / 160),
                  ),
                  itemCount: list.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return list[index]['type'] == 'Gents'
                        ? InkWell(
                            onTap: () {
                              Get.to(TailerDataView(
                                title: list[index]['product_name'].toString(),
                                img: list[index]['imgUrl'].toString(),
                                description: list[index]['product_description']
                                    .toString(),
                                price: list[index]['product_price'].toString(),
                                type: list[index]['type'].toString(),
                              ));
                            },
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 20,
                              child: Stack(
                                children: <Widget>[
                                  ConstrainedBox(
                                      constraints:
                                          const BoxConstraints.expand(),
                                      child: Image.network(
                                        list[index]['imgUrl'],
                                        fit: BoxFit.fill,
                                      )),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: ClipRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 1.0, sigmaY: 1.0),
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                              color: AppColors.backGroundColor
                                                  .withOpacity(0.5)),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                list[index]['product_name'],
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: IconButton(
                                      onPressed: () {
                                                                                 FirebaseFirestore.instance.collection('Posts').doc(list[index]['id']).delete();

                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: AppColors.backGroundColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox();
                  });
            }
          }),
    );
  }
}
