import 'package:flutter/material.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;

class ImageInput extends StatefulWidget {

  final Function selectImage;

  const ImageInput({super.key, required this.selectImage});

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
   if (imageFile == null) {
     return;
   }
   setState(() {
     _storedImage = File(imageFile.path);
     print("_storedImage $_storedImage");
   });
   final appDir = await syspath.getApplicationDocumentsDirectory();
   final fileName = path.basename(_storedImage!.path);
   final savedImage = await _storedImage?.copy("${appDir.path}/$fileName");
   widget.selectImage(savedImage);
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
