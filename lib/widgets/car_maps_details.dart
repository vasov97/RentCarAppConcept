import 'package:flutter/material.dart';
import 'package:rent_car_concept/models/car.dart';
import 'package:rent_car_concept/theme/icons/app_icons.dart';
import 'package:rent_car_concept/theme/styles/app_styles.dart';
import 'package:rent_car_concept/theme/typography/app_typography.dart';
import 'package:rent_car_concept/widgets/feature_icon_row.dart';

class CarMapsDetails extends StatelessWidget {
  const CarMapsDetails({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            decoration: AppStyles.carMapsDetailsDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  '${car.brand} ${car.model}',
                  style: AppTypography.whiteFont24,
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppIcons.direction,
                        const SizedBox(width: 5),
                        Text(
                          '> ${car.distance} km',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 3),
                        Image.asset(
                          'assets/fuel.png',
                          color: Colors.white,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${car.fuelCapacity.toStringAsFixed(0)}l',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: AppStyles.carMapsDetailsFeaturesDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FeatureIconRow(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${car.pricePerHour.toStringAsFixed(0)}/day',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          child: const Text('Book Now',
                              style: TextStyle(color: Colors.white)))
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 10,
              right: 10,
              child: Image.asset(
                car.imagePath,
                height: 100,
              ))
        ],
      ),
    );
  }
}
