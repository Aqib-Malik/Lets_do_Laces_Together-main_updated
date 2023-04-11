import 'package:flutter/material.dart';
import 'package:lets_do_laces_together/Screens/Tailor%20Panel/orderLists/contactbuttons.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final double neckSize;
  final double chestSize;
  final double waistSize;
  final double hipSize;
  final double inseamLength;
  // final String tailorEmail;
  final String gender;
  final String customerEmail;
  final String customerImage;
  final String customerName;
  final String customerAddress;
  final String customerPhone;

  DetailPage({
    required this.neckSize,
    required this.chestSize,
    required this.waistSize,
    required this.hipSize,
    required this.inseamLength,
    // required this.tailorEmail,
    required this.gender,
    required this.customerEmail,
    required this.customerImage,
    required this.customerName,
    required this.customerAddress,
    required this.customerPhone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Measurement Details'),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  Text(
                    'Measurement Details',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Neck Size: ${neckSize.toStringAsFixed(2)}"',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Chest Size: ${chestSize.toStringAsFixed(2)}"',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Waist Size: ${waistSize.toStringAsFixed(2)}"',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Hip Size: ${hipSize.toStringAsFixed(2)}"',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Inseam Length: ${inseamLength.toStringAsFixed(2)}"',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // Text(
                  //   'Tailor Email: $tailorEmail',
                  //   style: TextStyle(
                  //     fontSize: 16.0,
                  //   ),
                  // ),
                  // SizedBox(height: 16.0),
                  Text(
                    'Customer Details',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Gender: $gender',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Email: $customerEmail',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Name: $customerName',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Address: $customerAddress',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                 
      
                  SizedBox(height: 8.0),
                  Text(
                    'Phone: $customerPhone',
              style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(customerImage),
              ),
              Container(),
      //         ContactButtons(
      //   phoneNumber: '+1234567890',
      //   messageText: 'Hello, how are you?',
      //   whatsAppMessageText: 'Hello, how are you?',
      // )
             
            ],
          ),
        ),
        Positioned(
          top: 70,
          right: 10,
          child:  ContactButtons(
        phoneNumber: '+1234567890',
        messageText: 'Hello, how are you?',
        whatsAppMessageText: 'Hello, how are you?',
      ))
          ],
        ),
      ),
);
  }}






