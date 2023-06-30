import 'package:favorite_places/model/place.dart';
import 'package:favorite_places/providers/place_provider.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  Future<void> gotoAddPlaces() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const AddPlace(),
      ),
    );
    setState(() {});
  }

  void navigateToPlaceDetail() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const PlaceDetail()));
  }

  @override
  Widget build(BuildContext context) {
    List<Place> addedPlaces = ref.watch(placeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(onPressed: gotoAddPlaces, icon: const Icon(Icons.add))
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
                  title: Text(
                    addedPlaces[index].title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                );
              },
              itemCount: addedPlaces.length,
            ),
    );
  }
}
