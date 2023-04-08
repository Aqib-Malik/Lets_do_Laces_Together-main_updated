import 'package:flutter/material.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';

class DropDowns extends StatefulWidget {
  const DropDowns({Key? key}) : super(key: key);

  @override
  State<DropDowns> createState() => _DropDownsState();
}

class _DropDownsState extends State<DropDowns> {
  String dropdownValue = 'Gents';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: dropdownValue,

        items: <String>['Gents', 'Ladies']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(fontSize: 20),
            ),
          );
        }).toList(),
        dropdownColor: AppColors.backGroundColor,
        style:
            const TextStyle(color: Colors.white), // Sets the menu color to red

        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
      ),
    );
  }
}
