import 'package:cloud_firestore/cloud_firestore.dart';

class Rent {
  final String? id;
  final String carId;
  final String userId;
  final Timestamp startDate;
  final Timestamp endDate;
  final double totalCost;
  final bool isCompleted;

  Rent({
    this.id,
    required this.carId,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.totalCost,
    required this.isCompleted,
  });

  Map<String, dynamic> toJson() {
    return {
      'carId': carId,
      'userId': userId,
      'startDate': startDate,
      'endDate': endDate,
      'totalCost': totalCost,
      'isCompleted': isCompleted,
    };
  }

  factory Rent.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    return Rent(
      id: snapshot.id,
      carId: data?['carId'] ?? '',
      userId: data?['userId'] ?? '',
      startDate: data?['startDate'] ?? Timestamp.now(),
      endDate: data?['endDate'] ?? Timestamp.now(),
      totalCost: data?['totalCost'] ?? 0.0,
      isCompleted: data?['isCompleted'] ?? false,
    );
  }
}
