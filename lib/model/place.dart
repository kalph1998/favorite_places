import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;

  const PlaceLocation(
      {required this.latitude, required this.longitude, required this.address});
}

class Place {
  final String id;
  final String title;
  final File imageFile;
  final PlaceLocation location;
  Place({
    required this.title,
    required this.imageFile,
    required this.location,
    String? id,
  }) : id = id ?? uuid.v4();
}
