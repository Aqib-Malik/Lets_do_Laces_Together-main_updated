import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AvatarPicker extends StatefulWidget {
  final double size;
  final Function(File) onImageSelected;
  final String defaultImage;

  const AvatarPicker({
    Key? key,
    this.size = 100.0,
    required this.onImageSelected,
    required this.defaultImage,
  }) : super(key: key);

  @override
  _AvatarPickerState createState() => _AvatarPickerState();
}

class _AvatarPickerState extends State<AvatarPicker> {
  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        widget.onImageSelected(_image!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            _pickImage();
          },
          child: Stack(
            children: [
              CircleAvatar(
                radius: widget.size / 2,
                backgroundImage: _image != null
                    ? FileImage(_image!)
                    : widget.defaultImage.isNotEmpty
                        ? NetworkImage(widget.defaultImage)
                            as ImageProvider<Object>?
                        : null,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: widget.size / 6,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
