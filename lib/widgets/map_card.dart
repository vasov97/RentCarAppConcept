import 'package:flutter/material.dart';
import 'package:rent_car_concept/extensions/app_extensions.dart';
import 'package:rent_car_concept/models/car.dart';
import 'package:rent_car_concept/router/app_router.dart';

class MapCard extends StatelessWidget {
  const MapCard({
    super.key,
    required this.car,
    required Animation<double>? animation,
  }) : _animation = animation;

  final Animation<double>? _animation;
  final Car car;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.appRouter.push(MapsDetailsRoute(car: car)),
      child: Container(
        height: 170,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Transform.scale(
            scale: _animation!.value,
            alignment: Alignment.center,
            child: Image.asset(
              'assets/maps.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
