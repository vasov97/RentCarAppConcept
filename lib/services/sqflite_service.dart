import 'package:path/path.dart';
import 'package:rent_car_concept/models/car.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteService {
  static final SqfliteService _instance = SqfliteService._internal();
  factory SqfliteService() => _instance;

  SqfliteService._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'cars_database.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE cars(
            id TEXT PRIMARY KEY,
            imagePath TEXT,
            brand TEXT,
            model TEXT,
            location TEXT,
            fuelType TEXT,
            transmissionType TEXT,
            distance REAL,
            fuelCapacity REAL,
            pricePerHour REAL,
            rentalPrice REAL,
            rating REAL,
            isAvailable INTEGER
          )
        ''');
      },
    );
  }

  Future<void> insertCar(Car car) async {
    final db = await database;
    await db.insert(
      'cars',
      car.toDocumentSnapshot(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Car>> getFavoriteCars() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('cars');
    return List.generate(maps.length, (i) {
      return Car(
        id: maps[i]['id'],
        imagePath: maps[i]['imagePath'],
        brand: maps[i]['brand'],
        model: maps[i]['model'],
        location: maps[i]['location'],
        fuelType: maps[i]['fuelType'],
        transmissionType: maps[i]['transmissionType'],
        distance: maps[i]['distance'],
        fuelCapacity: maps[i]['fuelCapacity'],
        pricePerHour: maps[i]['pricePerHour'],
        rentalPrice: maps[i]['rentalPrice'],
        rating: maps[i]['rating'],
        isAvailable: maps[i]['isAvailable'] == 1,
      );
    });
  }

  Future<void> deleteCar(String id) async {
    final db = await database;
    await db.delete(
      'cars',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<bool> isFavorite(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
    return maps.isNotEmpty;
  }
}
