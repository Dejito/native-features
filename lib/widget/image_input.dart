import 'package:flutter/material.dart';

import 'dart:io';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? imageTaken;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          height: 100,
          width: 100,
          child: Text(
            "No image taken",
            textAlign: TextAlign.center,
            // style: TextStyle(
            //   te
            // ),
          ),
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: (){},
            icon: const Icon(
                Icons.camera
            ),
            label: const Text("Text Picture"),
          ),
        ),
      ],
    );
  }
}
