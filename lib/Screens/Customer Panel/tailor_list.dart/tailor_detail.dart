import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_do_laces_together/Screens/Customer%20Panel/tailor_list.dart/measurement_form.dart';
import 'package:lets_do_laces_together/Utils/AppColors/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ExpertScreen extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String title;
  final String phone;
  final String location;
  final String description;
  final String email;

  ExpertScreen({
    required this.imageUrl,
    required this.name,
    required this.title,
    required this.phone,
    required this.location,
    required this.description, required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name + ' Details',
          style: TextStyle(
            color: Color.fromARGB(255, 244, 240, 240),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.backGroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(width: 8),
                        Text(phone),
                        SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () => launch('tel:$phone'),
                          child: Text('Call'),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () => launch('sms:$phone'),
                          child: Text('SMS'),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () => launch('https://wa.me/$phone'),
                          child: Text('WhatsApp'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 8),
                      Text(location),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(MeasurementForm(email:email));
                      },
                      child: Container(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Place Order',
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
          ],
        ),
      ),
    );
  }
}
