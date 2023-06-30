import 'package:favorite_places/model/place.dart';
import 'package:flutter/material.dart';

class PlaceDetail extends StatelessWidget {
  final Place selectedPlace;
  const PlaceDetail({Key? key, required this.selectedPlace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
      ),
    );
  }
}
