import 'package:flutter/foundation.dart';
import 'package:rent_car_concept/models/car.dart';
import 'package:rent_car_concept/services/sqflite_service.dart';

class FavoritesProvider extends ChangeNotifier {
  final SqfliteService _sqfliteService = SqfliteService();
  List<Car> _favorites = [];
  List<Car> get favorites => _favorites;

  FavoritesProvider() {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    _favorites = await _sqfliteService.getFavoriteCars();
    notifyListeners();
  }

  Future<void> addFavorite(Car car) async {
    await _sqfliteService.insertCar(car);
    _favorites.add(car);
    notifyListeners();
  }

  Future<void> removeFavorite(String id) async {
    await _sqfliteService.deleteCar(id);
    _favorites.removeWhere((car) => car.id == id);
    notifyListeners();
  }

  bool isFavorite(String id) {
    return _favorites.any((car) => car.id == id);
  }
}
