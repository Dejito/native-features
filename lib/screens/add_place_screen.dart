import 'package:flutter/material.dart';
import 'package:native_features/provider/great_places.dart';
import 'package:native_features/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

import '../widget/image_input.dart';
import 'dart:io';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  const AddPlaceScreen({super.key});

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _imagePicked;

  Future<File> _selectImage(File pickedImage) async {
   return _imagePicked = pickedImage;
  }

  void _addSelectedImage(){
    print("got to push replacement");

    // if (_titleController.text.isEmpty || _imagePicked == null) {
    //   return;
    // }
    print("got to push replacement>>>>>");
    print("_imagePicked is $_imagePicked");
    Provider.of<GreatPlaces>(context, listen: false).addLocation(_titleController.text, _imagePicked!);
    Navigator.of(context).pushReplacementNamed(PlacesListScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ImageInput(selectImage: _selectImage),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text('Add Place'),
            onPressed: _addSelectedImage,
            // style: ,
          ),
        ],
      ),
    );
  }
}
