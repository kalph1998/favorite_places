import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Place {
  final String id;
  final String title;
  final File imageFile;
  Place({required this.title, required this.imageFile}) : id = uuid.v4();
}
