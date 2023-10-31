import 'package:flutter/foundation.dart';

import '../models/place.dart';
import 'dart:io';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addLocation(String placeTitle, File placeImage) {
    final newLocation = Place(
      id: DateTime.now().toIso8601String(),
      title: placeTitle,
      location: PlaceLocation(
        address: "Erin lakatabu",
        latitude: 7.7599,
        longitude: 4.5653,
      ),
      image: placeImage,
    );
    _items.add(newLocation);
    notifyListeners();
  }

}