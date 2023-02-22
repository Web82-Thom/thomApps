import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thomapps/screens/auths/views/auth_view.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagePickFn,);

  final void Function(File pickedImage) imagePickFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImage;
  final picker = ImagePicker();

  void pickImage() async {
    final pickedImage = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );

    setState(() {
      _pickedImage = File(pickedImage!.path);
      // authController.userImageFile = File(pickedImage.path);
    });
    widget.imagePickFn(File(pickedImage!.path));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage!) : null,
          radius: 80,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 0,
              left: 130,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.amber,
                size: 45,
              ),
              onPressed: pickImage,
            ),
          ),
        ),
      ],
    );
  }
}
