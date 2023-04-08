import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../change_status_model.dart';

class ChangeStatusModelController{

  List<ChangeStatusModel> model =[
    ChangeStatusModel(
    title: 'Pending',icon: Icon(Icons.done),
        ontap: (){},
    ),
    ChangeStatusModel(
      title: 'In Progress',icon: Icon(Icons.add),
      ontap: (){},
    ),ChangeStatusModel(
      title: 'Completed',icon: Icon(Icons.add),
      ontap: (){},
    ),
    ChangeStatusModel(
      title: 'Delivered',icon: Icon(Icons.add),
      ontap: (){},
    )
  ];
}