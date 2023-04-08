// aimport 'package:flutter/material.dart';
//
// import '../Model/controller/change_status_model_controller.dart';
//
//
// class AlertBox extends StatelessWiadget {
//
//   const AlertBox({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  showDialog<void>(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//               insetPadding: EdgeInsets.symmetric(horizontal: 40,vertical: 250),
//
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(5))),
//               // title: const Text('Basic dialog title'),
//               content:Column(children: [
//                 Text('Change Status'),
//                 Divider(thickness: 2,),
//                 Expanded(
//                   child: ListView.builder(
//                       itemCount: _changeStatusModelController.model.length,
//                       itemBuilder: (context,index){
//                         return ListTile(
//                           onTap: (){},
//                           leading: _changeStatusModelController.model[index].icon,
//                           title: Text(_changeStatusModelController.model[index].title.toString()),
//                         );
//                       }),
//                 )
//               ],)
//           );
//         },
//       );
//     }
// }
// final changeStatusModelController =ChangeStatusModelController();
// }
//
//
