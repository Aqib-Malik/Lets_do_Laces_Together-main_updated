import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Utils/AppColors/app_colors.dart';

class CashOnDeliveryScreen extends StatefulWidget {
  final Function func;

  CashOnDeliveryScreen({Key? key, required this.func}) : super(key: key);

  @override
  _CashOnDeliveryScreenState createState() => _CashOnDeliveryScreenState();
}

class _CashOnDeliveryScreenState extends State<CashOnDeliveryScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cash on Delivery'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Neumorphic(
            style: NeumorphicStyle(
              depth: -8,
              intensity: 0.8,
              color: Colors.white,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Enter Cash on Delivery Information',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Neumorphic(
                      style: NeumorphicStyle(
                        depth: -4,
                        intensity: 0.8,
                        color: Colors.white,
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
                      ),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Neumorphic(
                      style: NeumorphicStyle(
                        depth: -4,
                        intensity: 0.8,
                        color: Colors.white,
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
                      ),
                      child: TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Neumorphic(
                      style: NeumorphicStyle(
                        depth: -4,
                        intensity: 0.8,
                        color: Colors.white,
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
                      ),
                      child: TextFormField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                        ),
                        maxLines: 3,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your address';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    NeumorphicButton(
                      style: NeumorphicStyle(
                        depth: 8,
                        intensity: 0.6,
                        color: AppColors.backGroundColor,
                        shape: NeumorphicShape.flat,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          this.widget.func();
                        }
                      },
                      child: Text(
                        'Place Order',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton.icon(
                            icon: Image.network(
                              'https://play-lh.googleusercontent.com/9-0wlkGycWAJRsuQ-p_bMqDGE0liYgihxKka0PtRjxqEiRVkDKaROEyFxYg520lLbpk',
                              height: 40,
                              width: 40,
                            ),
                            label: Text(
                              'JazzCash',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              launch('https://www.jazzcash.com.pk/');
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 8, 8, 8),
                              ),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: TextButton.icon(
                            icon: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv1LCOSy2IfpZFdqoQh5Jn-ivuF3lLopyinlPxJF7_hneWIUQrLTeUguHSRtDsULKIZpY&usqp=CAU',
                              height: 40,
                              width: 40,
                            ),
                            label: Text(
                              'EasyPaisa',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              launch('https://retailer.easypaisa.com.pk/merchantportal/#!bG9naW4');
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 36, 139, 77),
                              ),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
