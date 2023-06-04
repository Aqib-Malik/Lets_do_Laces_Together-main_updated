import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddBrandPage extends StatefulWidget {
  @override
  _AddBrandPageState createState() => _AddBrandPageState();
}

class _AddBrandPageState extends State<AddBrandPage> {
  File? _brandImage;
  final picker = ImagePicker();
  final brandNameController = TextEditingController();
  final brandOwnerNameController = TextEditingController();
  // final brandOwnerEmailController = TextEditingController();
  final brandOwnerContactController = TextEditingController();

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _brandImage = File(pickedFile.path);
      });
    }
  }

  Future uploadBrandImage() async {
    if (_brandImage == null) return;

    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final reference = FirebaseStorage.instance.ref().child('brand_images/$fileName');
    final uploadTask = reference.putFile(_brandImage!);

    final snapshot = await uploadTask.whenComplete(() => null);
    final imageUrl = await snapshot.ref.getDownloadURL();

    return imageUrl;
  }

  Future addBrandToFirestore() async {
    final brandName = brandNameController.text;
    final brandOwnerName = brandOwnerNameController.text;
    final brandOwnerEmail = FirebaseAuth.instance.currentUser!.email;
    final brandOwnerContact = brandOwnerContactController.text;

    final imageUrl = await uploadBrandImage();

    final brandData = {
      'brandName': brandName,
      'brandOwnerName': brandOwnerName,
      'brandOwnerEmail': brandOwnerEmail,
      'brandOwnerContact': brandOwnerContact,
      'brandImage': imageUrl,
    };

    await FirebaseFirestore.instance.collection('brands').add(brandData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Brand'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Neumorphic(
                style: NeumorphicStyle(
                  depth: -8,
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                ),
                child: InkWell(
                  onTap: pickImage,
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: _brandImage != null
                        ? Image.file(_brandImage!, fit: BoxFit.cover)
                        : Center(child: Text('Tap to select brand image')),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: brandNameController,
                decoration: InputDecoration(
                  labelText: 'Brand Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: brandOwnerNameController,
                decoration: InputDecoration(
                  labelText: 'Brand Owner Name',
                  border: OutlineInputBorder(),
                ),
              ),
              // SizedBox(height: 16),
              // TextField(
              //   controller: brandOwnerEmailController,
              //   decoration: InputDecoration(
              //     labelText: 'Brand Owner Email',
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              SizedBox(height: 16),
                            TextField(
                controller: brandOwnerContactController,
                decoration: InputDecoration(
                  labelText: 'Brand Owner Contact',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  await addBrandToFirestore();
                  // Reset the form after adding the brand
                  brandNameController.clear();
                  brandOwnerNameController.clear();
                  // brandOwnerEmailController.clear();
                  brandOwnerContactController.clear();
                  setState(() {
                    _brandImage = null;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Brand added successfully')),
                  );
                },
                child: Text('Add Brand'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

