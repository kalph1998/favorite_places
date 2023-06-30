import 'package:favorite_places/model/place.dart';
import 'package:favorite_places/providers/place_provider.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Place> addedPlaces = ref.watch(placeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const AddPlace(),
                  ),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: addedPlaces.isEmpty
          ? Center(
              child: Text(
                'No places added yet',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => PlaceDetail(
                          selectedPlace: addedPlaces[index],
                        ),
                      ),
                    );
                  },
                  title: Text(
                    addedPlaces[index].title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              },
              itemCount: addedPlaces.length,
            ),
    );
  }
}