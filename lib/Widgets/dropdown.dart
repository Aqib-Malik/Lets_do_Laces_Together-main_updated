import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {

  String title;
   DropDown({Key? key,required this.title,}) : super(key: key);



  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String dropdownValue = 'DHA';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(widget.title,style: const TextStyle(fontSize: 12),),
        ),
        SizedBox(
          height: 30,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,

              icon: const Icon(Icons.keyboard_arrow_down),
              isExpanded: true,
              iconSize: 30,
              elevation: 10,
              style: const TextStyle(color: Colors.black),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>[
                'DHA',
                'dha',

              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(

                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: Text(
                      value,
                      style: const TextStyle(
                          fontSize: 12,
                          letterSpacing: 0.9,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),

      ],);
  }
}
