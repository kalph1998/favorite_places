import 'package:flutter/material.dart';

class AddPlace extends StatefulWidget {
  const AddPlace({Key? key}) : super(key: key);

  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _formKey = GlobalKey<FormState>();
  late String placeName;

  void onSave() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(placeName);
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
