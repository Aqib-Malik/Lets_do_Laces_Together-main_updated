import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lets_do_laces_together/Screens/Tailor%20Panel/Taior_Orders/pending_order_details.dart';
import 'package:lets_do_laces_together/Screens/Tailor%20Panel/Taior_Orders/peneing_order_model.dart';


import '../Model/controller/change_status_model_controller.dart';


class PandingScreen extends StatefulWidget {
  const PandingScreen({Key? key}) : super(key: key);

  @override
  State<PandingScreen> createState() => _PandingScreenState();
}

class _PandingScreenState extends State<PandingScreen> {
  final _PendingDataController= PendingDataController();
  final _changeStatusModelController = ChangeStatusModelController();
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: _PendingDataController.PendingData.length,
        itemBuilder: (BuildContext context, int index) {
          return   Column(
            children: [
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Get.to(PendingOrderDetails());
                },
                child: SizedBox(
                  height: 210,
                  width: double.infinity,
                  child: Card(
                    elevation: 1,
                    color: Colors.blue[50],
                    child:Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Container(
                            child:Row(children: [
                              Text('Order ',style: TextStyle(color: Colors.black38,fontSize: 18),),
                              Text(_PendingDataController.PendingData[index].orderNum.toString(),style: TextStyle(color: Colors.black38,fontSize: 18),),
                            ],),
                          ),
          Container(
          child:Row(children: [
          Text(_PendingDataController.PendingData[index].daysLeft.toString(),style: TextStyle(color: Colors.red[300],fontSize: 20),),
          Text(' Days Left',style: TextStyle(color: Colors.red[300],fontSize: 20),),
          ],))
                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 2,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child:Row(children: [
                                Text('Amount Due',style: TextStyle(fontSize: 13),),
                                Text(_PendingDataController.PendingData[index].amount.toString(),style: TextStyle(fontSize: 13),),
                              ],),
                            ),
                            Container(
                                child:Row(children: [

                                  Text(_PendingDataController.PendingData[index].date.toString(),style: TextStyle(fontSize: 13),),
                                ],))
                          ],),
                      ),
                      SizedBox(height: 10,),
                      Row(children: [
                        Column(children: [
                        SizedBox(
                          height:130,
                          width:130,
                          child: Image.asset(_PendingDataController.PendingData[index].img.toString(),),
                        )
                        ],),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(_PendingDataController.PendingData[index].name.toString(),),
                          SizedBox(height: 10,),
                          Text(_PendingDataController.PendingData[index].itemName.toString(),),
                          SizedBox(height: 6,),
                          Row(children: [
                            Text(_PendingDataController.PendingData[index].item.toString(),),
                            Text(' Item'),
                          ],),
                          SizedBox(height: 10,),
                          SizedBox(
                            height: 40.h,
                            width: 190.w,
                            child: TextButton(
                              onPressed: () {
                                 _dialogBuilder(context);                        },
                              style: ElevatedButton.styleFrom(
                                // primary: Colors.red[300],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side:  const BorderSide(
                                      color: Colors.black38,
                                    )),
                                // elevation: 15.0,
                              ),
                              child:  Row(children: const [
                                Icon(Icons.watch_later_outlined),
                                SizedBox(width: 5,),
                                Text(
                                  'Work In Progress',
                                  style: TextStyle(fontSize: 12,color: Colors.black),
                                )
                              ],),
                            ),
                          ),
                        ],)
                      ],)
                    ],)


                  ),
                ),
              ),
            ],
          );
        });
  }
}



Future<void> _dialogBuilder(BuildContext context) {
  final screen =[
     // TOrdersScreen(CustomTabBar(OutOfDelivery())),
    //const CustomTabBar(OutOfDelivery()),

  ];
  print('hello');

  final _changeStatusModelController =ChangeStatusModelController();
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 50,vertical: 210),

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          // title: const Text('Basic dialog title'),
          content:Column(children: [
            Text('Change Status'),
            Divider(thickness: 2,),
            Expanded(
              child: ListView.builder(
                  itemCount: _changeStatusModelController.model.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      onTap: (){
                        // Get.to(screen[index]);
                      },
                      leading: _changeStatusModelController.model[index].icon,
                      title: Text(_changeStatusModelController.model[index].title.toString()),
                    );
                  }),
            )
          ],)
      );
    },
  );
}
