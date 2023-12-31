import 'package:flutter/material.dart';
import 'package:native_features/provider/great_places.dart';
import 'package:native_features/screens/add_place_screen.dart';
import 'package:native_features/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          hintColor: Colors.amber,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName: (context) => const AddPlaceScreen(),
          PlacesListScreen.routeName: (context) => const PlacesListScreen(),
        },
      ),
    );
  }
}
