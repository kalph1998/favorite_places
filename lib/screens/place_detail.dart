import 'package:favorite_places/keys/api_key.dart';
import 'package:favorite_places/model/place.dart';
import 'package:flutter/material.dart';

class PlaceDetail extends StatelessWidget {
  final Place selectedPlace;
  const PlaceDetail({Key? key, required this.selectedPlace}) : super(key: key);

  String get locationImage {
    var lat = selectedPlace.location.latitude;
    var long = selectedPlace.location.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center$lat,$long&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:S%7C$lat,$long&key=$googleKey';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
      ),
      body: Stack(children: [
        Image.file(
          selectedPlace.imageFile,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(locationImage),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black54],
                  begin: Alignment.topRight,
                ),
              ),
              child: Text(
                selectedPlace.location.address,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            )
          ]),
        )
      ]),
    );
  }
}
