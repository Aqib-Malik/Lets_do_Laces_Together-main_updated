import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OderDeliverd extends StatefulWidget {
  const OderDeliverd({Key? key}) : super(key: key);

  @override
  State<OderDeliverd> createState() => _OderDeliverdState();
}

class _OderDeliverdState extends State<OderDeliverd> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20,),
          Card(
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
                            Text('2',style: TextStyle(color: Colors.red[300],fontSize: 20),),
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
                          Text('Syed Sadan Ali',style: TextStyle(fontSize: 13),),

                        ],),
                      ),
                      Container(
                          child:Row(children: [
                          Icon(Icons.done_sharp,color: Colors.green,),
                            Text("Order Deliverd",style: TextStyle(fontSize: 13),),
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
                          Icon(Icons.payments_outlined),
                          SizedBox(width: 5,),
                          Text('Payment Recived ',style: TextStyle(fontSize: 13),),

                        ],),
                      ),
                      Container(
                          child:Row(children: [
                            Icon(Icons.done_sharp,color: Colors.green,),
                            Text("1000",style: TextStyle(fontSize: 13),),
                          ],))
                    ],),
                ),
                SizedBox(height: 10,),
              ],)

          ),
        ],
      ),
    );
  }
}
