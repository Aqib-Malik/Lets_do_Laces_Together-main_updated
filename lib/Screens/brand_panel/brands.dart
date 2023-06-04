import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
  import 'package:url_launcher/url_launcher.dart';

class BrandScreen extends StatelessWidget {
   final CollectionReference brandsCollection =
      FirebaseFirestore.instance.collection('brands');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brands'),
      ),
      body:  StreamBuilder<QuerySnapshot>(
        stream: brandsCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          final brands = snapshot.data!.docs;

          return ListView.builder(
            itemCount: brands.length,
            padding: EdgeInsets.all(16.0),
            itemBuilder: (context, index) {
              final brand = brands[index].data() as Map<String, dynamic>;

              return buildBrandCard(
                brand['brandName'],
                brand['brandImage'],
                brand['brandOwnerName'],
                brand['brandOwnerEmail'],
                brand['brandOwnerContact'],
                Icons.email,
                MediaQuery.of(context).size.width,context
              );
            },
          );
        },
      ),
    );
  
    
  }

Widget buildBrandCard(
  String name,
  String imageUrl,
  String ownerName,
  String email,
  String contactNumber,
  IconData whatsappIcon,
  double maxWidth,
  BuildContext context,
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12.0)),
        depth: 4.0,
        intensity: 0.8,
        surfaceIntensity: 0.2,
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Add action when the brand image is tapped
              },
              child: Container(
                width: maxWidth * 0.6,
                height: maxWidth * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageUrl),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              name,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Owner: $ownerName',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email, size: 16.0),
                SizedBox(width: 4.0),
                Text(
                  email,
                  style: TextStyle(fontSize: 14.0),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
    _launchSMS(contactNumber);
                  },
                  child: Icon(Icons.message, size: 24.0, color: Colors.blue),
                ),
                SizedBox(width: 16.0),
                GestureDetector(
                  onTap: () {
    _launchWhatsApp(contactNumber);
                  },
                  child: Icon(whatsappIcon, size: 24.0, color: Colors.green),
                ),
                SizedBox(width: 16.0),
                GestureDetector(
                  onTap: () => _launchPhoneCall(contactNumber),
                  child: Icon(Icons.phone, size: 24.0, color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

void _launchPhoneCall(String phoneNumber) async {
  final Uri phoneLaunchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  if (await canLaunch(phoneLaunchUri.toString())) {
    await launch(phoneLaunchUri.toString());
  } else {
    throw 'Could not launch phone call';
  }
}
void _launchSMS(String phoneNumber) async {
  final Uri smsLaunchUri = Uri(
    scheme: 'sms',
    path: phoneNumber,
  );
  if (await canLaunch(smsLaunchUri.toString())) {
    await launch(smsLaunchUri.toString());
  } else {
    throw 'Could not launch SMS';
  }
}

void _launchWhatsApp(String phoneNumber) async {
  final Uri whatsappLaunchUri = Uri(
    scheme: 'https',
    host: 'wa.me',
    path: '/$phoneNumber',
  );
  if (await canLaunch(whatsappLaunchUri.toString())) {
    await launch(whatsappLaunchUri.toString());
  } else {
    throw 'Could not launch WhatsApp';
  }
}

}
