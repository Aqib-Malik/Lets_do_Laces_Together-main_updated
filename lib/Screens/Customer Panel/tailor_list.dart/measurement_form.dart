import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';

class MeasurementForm extends StatefulWidget {
  final String email;
  // MeasurementForm({required this.email,
  // });

  @override
   
  MeasurementForm({super.key, required this.email});
  _MeasurementFormState createState() => _MeasurementFormState();
}

class _MeasurementFormState extends State<MeasurementForm> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  double _neckSize = 0.0; // Initialize with default values
  double _chestSize = 0.0;
  double _waistSize = 0.0;
  double _hipSize = 0.0;
  double _inseamLength = 0.0;
   String? _gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Measurement Form",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.backGroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value;
                  },
                ),
                SizedBox(height: 16.0),
                 SizedBox(height: 16.0),
                Text(
                  'Gender:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                RadioListTile(
                  title: Text('Male'),
                  value: 'male',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Female'),
                  value: 'female',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value as String?;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Neck size (inches)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your neck size';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _neckSize = double.parse(value!);
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Chest size (inches)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your chest size';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _chestSize = double.parse(value!);
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Waist size (inches)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your waist size';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _waistSize = double.parse(value!);
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Hip size (inches)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your hip size';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _hipSize = double.parse(value!);
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Inseam length (inches)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your inseam length';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _inseamLength = double.parse(value!);
                  },
                ),
                SizedBox(height: 16.0),
                
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                         _formKey.currentState!.save();
                        await FirebaseFirestore.instance
                            .collection('order')
                            .add({
                          "name": _name,
                          "neckSize":
                              _neckSize, // Initialize with default values
                          "chestSize": _chestSize,
                          "waistSize": _waistSize,
                          "hipSize": _hipSize,
                          "inseamLength": _inseamLength,
                          "tailor_email":this.widget.email,
                          "is_approve": false,
                          "is_pending": true,
                          "is_completed":false,
                          "Gender":_gender,
                        }).whenComplete(() {
                         

                          // TODO: Process the form data (e.g., save to database)

                          // Navigate to a success page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SuccessPage(),
                            ),
                          );
                        });
                        // Save the form
                      }
                      // Get.to(MeasurementForm());
                    },
                    child: Container(
                      height: 50,
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.backGroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success!'),
      ),
      body: Center(
        child: Text('Your measurement form has been submitted.'),
      ),
    );
  }
}
