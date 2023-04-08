import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class MaxMInDropDown extends StatefulWidget {
  const MaxMInDropDown({Key? key}) : super(key: key);
  @override
  State<MaxMInDropDown> createState() => _MaxMInDropDownState();
}
class _MaxMInDropDownState extends State<MaxMInDropDown> {
  String dropdownValue = 'Min';
  String dropdownValue1 = 'Max';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 2,

child:Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Padding(
      padding: const EdgeInsets.only(left: 13,top: 5),
      child: Text('Price'),
    ),
  Padding(
    padding: const EdgeInsets.only(left: 13,right: 13),
    child:Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [

        DropdownButtonHideUnderline(

          child: DropdownButton<String>(

            value: dropdownValue,

            items: <String>['Min', 'Cat', 'Tiger', 'Lion']

                .map<DropdownMenuItem<String>>((String value) {

              return DropdownMenuItem<String>(

                value: value,

                child: Text(

                  value,

                  style: TextStyle(fontSize: 14),

                ),

              );

            }).toList(),

            // Step 5.

            onChanged: (String? newValue) {

              setState(() {

                dropdownValue = newValue!;

              });

            },

          ),

        ),

        Text('to',style: TextStyle(fontSize: 16),),

        DropdownButtonHideUnderline(

          child: DropdownButton<String>(

            value: dropdownValue1,

            items: <String>['Max', 'Cat', 'Tiger', 'Lion']

                .map<DropdownMenuItem<String>>((String value) {

              return DropdownMenuItem<String>(

                value: value,

                child: Text(

                  value,

                  style: TextStyle(fontSize: 14),

                ),

              );

            }).toList(),

            // Step 5.

            onChanged: (String? newValue) {

              setState(() {

                dropdownValue1 = newValue!;

              });

            },

          ),

        ),

      ],),
  )
],)
      ),
    );

  }
}





