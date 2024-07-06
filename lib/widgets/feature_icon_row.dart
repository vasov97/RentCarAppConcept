import 'package:flutter/material.dart';
import 'package:rent_car_concept/widgets/feature_icon.dart';

class FeatureIconRow extends StatelessWidget {
  const FeatureIconRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FeatureIcon(
            icon: Icons.local_gas_station,
            title: 'Diesel',
            subtitle: 'Common Rail'),
        FeatureIcon(
            icon: Icons.speed, title: 'Acceleration', subtitle: '0 - 100km/s'),
        FeatureIcon(
            icon: Icons.ac_unit, title: 'Cold', subtitle: 'Temp Control'),
      ],
    );
  }
}
