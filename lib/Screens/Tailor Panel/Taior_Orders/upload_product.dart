import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lets_do_laces_together/Controller/auth_controller.dart';
import '../../../Utils/AppColors/app_colors.dart';

class UploadProduct extends StatefulWidget {
  final String uid;
  const UploadProduct({super.key, required this.uid});

  @override
  State<UploadProduct> createState() => _UploadProductState();
}

class _UploadProductState extends State<UploadProduct> {
  String dropdownValue = 'Ladies';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final authController = Get.put(AuthController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _choiceController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _choiceController.dispose();
    super.dispose();
  }

  double? area;
  String? _selectedType;
  final List<String> _type = ["Ladies", "Gents"];
  File? _image;
  final picker = ImagePicker();
  String? imgUrl;

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(
      () {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      },
    );
  }

  uploadFile() async {
    Reference ref =
        FirebaseStorage.instance.ref().child('posts/${_image!.path}');
    UploadTask uploadTask = ref.putFile(_image!);
    final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
    var imageUrl = await taskSnapshot.ref.getDownloadURL();
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: StreamBuilder(
                stream: authController.users
                    .where('uid',
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  final List<DocumentSnapshot> data = snapshot.data!.docs;
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _image != null
                                ? Card(
                                    child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.file(
                                        File(_image!.path),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    height: 250,
                                    width: double.infinity,
                                    child: Column(
                                      children: const [
                                        Icon(
                                          Icons.image_outlined,
                                          size: 200,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Drop Images",
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                    style: ElevatedButton.styleFrom(),
                                    child: const Text("Add Product",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                    onPressed: () {
                                      // openImages();
                                      getImage();
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Select Category',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: DropdownButton(
                                        underline: Container(),
                                        isExpanded: true,
                                        hint: _selectedType == null
                                            ? const Text('Select Type')
                                            : Text(
                                                _selectedType.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                        value: _selectedType,
                                        onChanged: (newValue) {
                                          setState(() {
                                            setState(() {});
                                            _selectedType = newValue.toString();
                                          });
                                        },
                                        items: _type.map((value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Material(
                                    elevation: 2.0,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter the product Title";
                                        }
                                        return null;
                                      },
                                      controller: _titleController,
                                      onChanged: (String value) {},
                                      cursorColor: AppColors.backGroundColor,
                                      decoration: InputDecoration(
                                          hintText: "Title",
                                          prefixIcon: Material(
                                            elevation: 0,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15)),
                                            child: Icon(
                                              Icons.title,
                                              color: AppColors.backGroundColor,
                                            ),
                                          ),
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 25,
                                                  vertical: 13)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Material(
                                    elevation: 2.0,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter the product Price";
                                        }
                                        return null;
                                      },
                                      controller: _priceController,
                                      keyboardType: TextInputType.number,
                                      onChanged: (String value) {},
                                      cursorColor: AppColors.backGroundColor,
                                      decoration: InputDecoration(
                                          hintText: "Price",
                                          prefixIcon: Material(
                                            elevation: 0,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15)),
                                            child: Icon(
                                              Icons.price_change,
                                              color: AppColors.backGroundColor,
                                            ),
                                          ),
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 25,
                                                  vertical: 13)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Material(
                                    elevation: 2.0,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please this field must be filled';
                                        }
                                        return null;
                                      },
                                      controller: _descriptionController,
                                      maxLines: 8,
                                      onChanged: (String value) {},
                                      cursorColor: AppColors.backGroundColor,
                                      decoration: const InputDecoration(
                                          hintText: "Description",
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 25, vertical: 13)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  color: Colors.white,
                                ),
                                child: TextButton(
                                  child: Text(
                                    "Upload",
                                    style: TextStyle(
                                        color: AppColors.backGroundColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (_selectedType != null) {
                                        if (_image != null) {
                                          Reference ref = FirebaseStorage
                                              .instance
                                              .ref()
                                              .child('posts/${_image!.path}');
                                          UploadTask uploadTask =
                                              ref.putFile(_image!);
                                          final TaskSnapshot taskSnapshot =
                                              await uploadTask
                                                  .whenComplete(() {});
                                          var imageUrl = await taskSnapshot.ref
                                              .getDownloadURL();
                                          print(
                                              "img url ${imageUrl.toString()}");
                                          authController.addShopDetails(
                                              _titleController.text.toString(),
                                              _priceController.text.toString(),
                                              _descriptionController.text
                                                  .toString(),
                                              _selectedType.toString(),
                                              data[index]['shopName']
                                                  .toString(),
                                              data[index]['shop'].toString(),
                                              data[index]['city'].toString(),
                                              data[index]['phone'].toString(),
                                              data[index]['deliveryName']
                                                  .toString(),
                                              data[index]['deliveryPhone']
                                                  .toString(),
                                              data[index]['name'].toString(),
                                              data[index]['phone'].toString(),
                                              imageUrl.toString(),
                                              context);
                                        }
                                      }
                                    }
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        );
                      });
                }),
          ),
        ),
      ),
    );
  }
}
