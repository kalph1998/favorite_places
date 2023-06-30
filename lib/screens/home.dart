import 'package:favorite_places/screens/add_place.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => AddPlace()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Text(
          'No places added yet',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
