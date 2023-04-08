import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';

import 'dropDownSelection.dart';
import '../../../Tailor Panel/Model/controller/controller.dart';

class MyDialog extends StatefulWidget {
  String img;
  String text;
  String price;
  String des;

  final VoidCallback onOkPressed;

  MyDialog({
    Key? key,
    required this.onOkPressed,
    required this.text,
    required this.img,
    required this.price,
    required this.des,
  }) : super(key: key);

  @override
  State<MyDialog> createState() => _MyDialogState();
}

final _LadiesCardController = LadiesCardController();

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backGroundColor,
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    print('Clicekd');
                    Get.back();
                  },
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: Colors.white,
                    size: 34,
                  ),
                ),
              ],
            ),
            Container(
              // height: MediaQuery.of(context).size.height * 0.3,
              child: Image.asset(
                widget.img.toString(),
                fit: BoxFit.fill,
              ),
            ),
            Text(
              widget.text.toString(),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              "Rs ${widget.price.toString()}",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            MyDropdownButton(),
            const Text(
              'Description:',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              widget.des.toString(),
            ),
          ],
        ),
      ),
      actions: [
        // TextButton(
        //   child: Text(
        //     'Cancel',
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   onPressed: () {

        //   },
        // ),
        TextButton(
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 30,
              )),
          onPressed: widget.onOkPressed,
        ),
      ],
    );
  }
}
