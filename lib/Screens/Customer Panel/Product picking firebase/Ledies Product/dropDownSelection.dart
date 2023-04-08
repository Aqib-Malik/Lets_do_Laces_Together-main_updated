import 'package:flutter/material.dart';

class MyDropdownButton extends StatefulWidget {
  @override
  _MyDropdownButtonState createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  String _selectedOption = 'Small'; // Set the initial value here

  void _onDropdownChanged(String? newValue) {
    setState(() {
      _selectedOption = newValue!;
    });
    print('Selected option: $_selectedOption');
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      underline: Container(),
      focusColor: Colors.white12,
      value: _selectedOption,
      onChanged: _onDropdownChanged,
      items: <String>['Small', 'Medium', 'Large', 'Ex Large']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: Colors.grey),
          ),
        );
      }).toList(),
    );
  }
}
