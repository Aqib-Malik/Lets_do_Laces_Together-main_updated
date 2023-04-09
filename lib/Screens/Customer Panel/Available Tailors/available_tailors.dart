import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Model/available_tailor_controller.dart';

class AvailableTailors extends StatefulWidget {
  const AvailableTailors({Key? key}) : super(key: key);

  @override
  State<AvailableTailors> createState() => _AvailableTailorsState();
}

class _AvailableTailorsState extends State<AvailableTailors> {
  final _AvailableTailorController = AvailableTailorController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _AvailableTailorController.modelData.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 5, bottom: 30, top: 3),
              child: Container(
                height: 190.h,
                width: 150.w,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue.shade300,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 70,
                      width: 80,
                      child: Image.network(
                        _AvailableTailorController.modelData[index].image
                            .toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      _AvailableTailorController.modelData[index].title
                          .toString(),
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.blue[300],
                        ),
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.blue[300],
                        ),
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.blue[300],
                        ),
                        Icon(
                          Icons.star,
                          size: 20,
                        ),
                      ],
                    ),
                    Text(
                      _AvailableTailorController.modelData[index].status
                          .toString(),
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
