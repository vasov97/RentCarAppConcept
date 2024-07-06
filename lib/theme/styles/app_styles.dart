import 'package:flutter/material.dart';
import 'package:rent_car_concept/theme/colors/app_colors.dart';

class AppStyles {
  static const LinearGradient linearGradient = LinearGradient(
    colors: [
      AppColors.firstGradient,
      AppColors.secondGradient,
      AppColors.thirdGradient
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static BoxDecoration carCardDecoration = BoxDecoration(
      color: const Color(0xFFCBF1F5),
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)
      ]);

  static BoxDecoration carDetailsDecoration = BoxDecoration(
      color: const Color(0xFFCBF1F5),
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)
      ]);

  static BoxDecoration carMapsDetailsDecoration = const BoxDecoration(
      color: Colors.black54,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      boxShadow: [
        BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)
      ]);

  static BoxDecoration carMapsDetailsFeaturesDecoration = const BoxDecoration(
      color: Color(0xFFCBF1F5),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ));
}
