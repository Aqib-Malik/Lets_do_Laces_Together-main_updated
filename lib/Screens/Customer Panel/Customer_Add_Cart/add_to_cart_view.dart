import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';
import 'add_adress.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({Key? key}) : super(key: key);

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        title: const Text(
          'Favorite Item',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 5,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Card(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.asset(
                          "assets/images/TailorImages/DressShirt.png"),
                      title: const Text(
                        'Kerm Abaya',
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: const Text(
                        '3 Item',
                        style: TextStyle(color: Colors.black38),
                      ),
                      trailing: Icon(
                        Icons.delete,
                        color: AppColors.backGroundColor,
                      ),
                    ),
                  ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
