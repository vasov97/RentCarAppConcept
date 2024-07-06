import 'package:flutter/material.dart';
import 'package:rent_car_concept/models/car.dart';

class CarDetailsRow extends StatelessWidget {
  const CarDetailsRow({
    super.key,
    required this.car,
  });

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Row(
              children: [
                Image.asset('assets/gps.png'),
                Text(' ${car.distance.toStringAsFixed(0)}km')
              ],
            ),
            const SizedBox(width: 10),
            Row(
              children: [
                Image.asset('assets/pump.png'),
                Text(' ${car.fuelCapacity.toStringAsFixed(0)}L')
              ],
            ),
          ],
        ),
        Text(
          '\$${car.pricePerHour.toStringAsFixed(0)}/h',
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
