import 'dart:io';

import 'package:flutter/material.dart';
import 'package:native_features/provider/great_places.dart';
import 'package:native_features/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  static const routeName = 'places_list_screen';
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final greatPlaces = Provider.of<GreatPlaces>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: greatPlaces.items.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<GreatPlaces>(
            builder: (BuildContext context, gp, Widget? child) {
              return ListView.builder(
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(gp.items[i].image),
                    ),
                    title: Text(gp.items[i].title),
                  );
                },
                itemCount: gp.items.length,
              );
            },
          ),
    );
  }
}
