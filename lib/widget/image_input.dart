import 'package:flutter/material.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;
  final imagePicker = ImagePicker();

  Future<void> pickImage() async {
   final imageFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
      preferredCameraDevice: CameraDevice.front
    );
   setState(() {
     _storedImage = File(imageFile!.path);
   });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          height: 100,
          width: 100,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: _storedImage == null ?   const Text(
            "No image taken",
            textAlign: TextAlign.center,
            // style: TextStyle(
            //   te
            // ),
          ) : Image.file(_storedImage!),
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: pickImage,
            icon: const Icon(Icons.camera),
            label: const Text("Take Picture"),
          ),
        ),
      ],
    );
  }
}
