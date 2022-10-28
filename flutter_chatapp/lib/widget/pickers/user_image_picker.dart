import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key});

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  final ImagePicker _picker = ImagePicker();
  File? _pickedImage;
  void _pickImage() async {
    final XFile? pickedImageFile =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedImage = pickedImageFile as File;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage!) : null,
        ),
        TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.image),
          label: Text(
            '画像追加',
          ),
        ),
      ],
    );
  }
}
