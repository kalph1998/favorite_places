import 'dart:io';

import 'package:favorite_places/model/place.dart';
import 'package:favorite_places/providers/place_provider.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';
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
  File? selectedImage;

  void onSave() {
    if (_formKey.currentState!.validate() && selectedImage != null) {
      _formKey.currentState!.save();
      ref.read(placeProvider.notifier).addPlace(
            Place(title: placeName, imageFile: selectedImage!),
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
              ImageInput(
                onSelectImage: (File image) {
                  selectedImage = image;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const LocationInput(),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                width: 130,
                child: ElevatedButton.icon(
                  onPressed: onSave,
                  icon: const Icon(Icons.add),
                  label: const Text('Add Place'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
