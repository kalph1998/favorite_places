import 'package:favorite_places/model/place.dart';
import 'package:favorite_places/providers/place_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlace extends ConsumerStatefulWidget {
  const AddPlace({Key? key}) : super(key: key);

  @override
  ConsumerState<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends ConsumerState<AddPlace> {
  final _formKey = GlobalKey<FormState>();
  late String placeName;

  void onSave() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ref.read(placeProvider).add(
            Place(id: DateTime.now().toString(), title: placeName),
          );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Title'),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return 'Please enter valid name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    placeName = value!;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 130,
                  child: ElevatedButton(
                    onPressed: onSave,
                    child: const Row(
                      children: [Icon(Icons.add), Text('Add Place')],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
