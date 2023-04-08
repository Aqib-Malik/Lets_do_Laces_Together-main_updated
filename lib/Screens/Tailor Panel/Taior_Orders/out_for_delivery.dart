import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class OutOfDelivery extends StatefulWidget {
  const OutOfDelivery({Key? key}) : super(key: key);

  @override
  State<OutOfDelivery> createState() => _OutOfDeliveryState();
}

class _OutOfDeliveryState extends State<OutOfDelivery> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20,),
          InkWell(
            onTap: (){

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
                              Text('#3884',style: TextStyle(color: Colors.black38,fontSize: 18),),
                            ],),
                          ),
                          Container(
                              child:Row(children: [
                                Text('5',style: TextStyle(color: Colors.red[300],fontSize: 20),),
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
                              Text("1000",style: TextStyle(fontSize: 13),),
                            ],),
                          ),
                          Container(
                              child:Row(children: [

                                Text("5th Jun 2023",style: TextStyle(fontSize: 13),),
                              ],))
                        ],),
                    ),
                    SizedBox(height: 10,),
                    Row(children: [
                      Column(children: [
                        SizedBox(
                          height:130,
                          width:130,
                          child: Image.asset("assets/images/TailorImages/DressShirt.png"),
                        )
                      ],),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Dr Tooba",),
                          SizedBox(height: 10,),
                          Text("Dress Shirt",),
                          SizedBox(height: 6,),
                          Row(children: [
                            Text("1"),
                            Text(' Item'),
                          ],),
                          SizedBox(height: 10,),
                          SizedBox(
                            height: 40.h,
                            width: 180.w,
                            child: TextButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                // primary: Colors.red[300],

                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side:  BorderSide(
                                      color: Colors.redAccent,
                                    )),
                                // elevation: 15.0,
                              ),
                              child:  Row(children: [
                                Icon(Icons.delivery_dining,color: Colors.red[300],),
                                SizedBox(width: 1,),
                                Text(
                                  'Out For Delivery',
                                  style: TextStyle(fontSize: 12,color: Colors.red[300]),
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
      ),
    );
  }
}
