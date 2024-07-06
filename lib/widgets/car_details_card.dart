import 'package:flutter/material.dart';
import 'package:rent_car_concept/pages/car_details_page.dart';
import 'package:rent_car_concept/theme/styles/app_styles.dart';
import 'package:rent_car_concept/theme/typography/app_typography.dart';

class CarDetailsCard extends StatelessWidget {
  const CarDetailsCard({
    super.key,
    required this.widget,
  });

  final CarDetailsPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppStyles.carDetailsDecoration,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Price',
                style: AppTypography.font16,
              ),
              const SizedBox(width: 20),
              Text(
                '\$${widget.car.pricePerHour}/h',
                style: AppTypography.greyw500,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Mileage',
                style: AppTypography.font16,
              ),
              const SizedBox(width: 20),
              Text(
                '${widget.car.distance.toStringAsFixed(0)}km',
                style: AppTypography.greyw500,
              ),
              const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Fuel',
                style: AppTypography.font16,
              ),
              const SizedBox(width: 20),
              Text(
                widget.car.fuelType,
                style: AppTypography.greyw500,
              ),
              const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Capacity',
                style: AppTypography.font16,
              ),
              const SizedBox(width: 20),
              Text(
                '${widget.car.fuelCapacity.toStringAsFixed(0)}l',
                style: AppTypography.greyw500,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Transmission',
                style: AppTypography.font16,
              ),
              const SizedBox(width: 20),
              Text(
                widget.car.transmissionType,
                style: AppTypography.greyw500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
