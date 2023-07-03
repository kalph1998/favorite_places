import 'package:favorite_places/model/place.dart';
import 'package:riverpod/riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();

  final db = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT , lat REAL , lng REAL , address TEXT)');
    },
    version: 1,
  );
  return db;
}

class PlaceNotifier extends StateNotifier<List<Place>> {
  PlaceNotifier() : super(const []);

  // Future<void> loadPlaces() async {
  //   final db = await _getDatabase();
  //   final data = await db.query('user_places');

  //   final places = data.map((row) {
  //     return Place(
  //       id: row['id'] as String,
  //       title: row['title'] as String,
  //       imageFile: File(row['image'] as String),
  //       location: PlaceLocation(
  //         address: row['address'] as String,
  //         latitude: row['lat'] as double,
  //         longitude: row['lng'] as double,
  //       ),
  //     );
  //   }).toList();

  //   state = places;
  // }

  void addPlace(Place place) async {
    // final appDir = await syspaths.getApplicationDocumentsDirectory();
    // final filename = path.basename(place.imageFile.path);
    // final copiedImage = await place.imageFile.copy('${appDir.path}/$filename');
    // final newPlace = Place(
    //     title: place.title, imageFile: copiedImage, location: place.location);
    // final db = await _getDatabase();

    // db.insert('user_places', {
    //   'id': newPlace.id,
    //   'title': newPlace.title,
    //   'image': newPlace.imageFile.path,
    //   'lat': newPlace.location.latitude,
    //   'lng': newPlace.location.longitude,
    //   'address': newPlace.location.address
    // });

    state = [...state, place];
  }
}

final placeProvider =
    StateNotifierProvider<PlaceNotifier, List<Place>>((ref) => PlaceNotifier());
