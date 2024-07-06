import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  String id;
  final String imagePath;
  final String brand;
  final String model;
  final String location;
  final String fuelType;
  final String transmissionType;

  final double distance;
  final double fuelCapacity;
  final double pricePerHour;
  final double rentalPrice;
  final double rating;

  final bool isAvailable;

  Car({
    required this.id,
    required this.imagePath,
    required this.brand,
    required this.model,
    required this.location,
    required this.fuelType,
    required this.transmissionType,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
    required this.rentalPrice,
    required this.rating,
    required this.isAvailable,
  });

  factory Car.fromDocumentSnaphot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>;
    return Car(
      id: data['id'] ?? '0',
      imagePath: data['imagePath'] ?? '',
      brand: data['brand'] ?? '',
      model: data['model'] ?? '',
      location: data['location'] ?? '',
      fuelType: data['fuelType'] ?? '',
      transmissionType: data['transmissionType'] ?? '',
      distance: data['distance'] ?? 0.0,
      fuelCapacity: data['fuelCapacity'] ?? 0.0,
      pricePerHour: data['pricePerHour'] ?? 0.0,
      rentalPrice: data['rentalPrice'] ?? 0.0,
      rating: data['rating'] ?? 0.0,
      isAvailable: data['isAvailable'] ?? false,
    );
  }

  Map<String, dynamic> toDocumentSnapshot() {
    return {
      'brand': brand,
      'imagePath': imagePath,
      'model': model,
      'location': location,
      'fuelType': fuelType,
      'transmissionType': transmissionType,
      'distance': distance,
      'fuelCapacity': fuelCapacity,
      'pricePerHour': pricePerHour,
      'rentalPrice': rentalPrice,
      'rating': rating,
      'isAvailable': isAvailable,
    };
  }
}
