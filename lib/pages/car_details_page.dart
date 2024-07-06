import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rent_car_concept/models/car.dart';
import 'package:rent_car_concept/theme/colors/app_colors.dart';
import 'package:rent_car_concept/theme/styles/app_styles.dart';
import 'package:rent_car_concept/widgets/car_card.dart';
import 'package:rent_car_concept/widgets/car_details_card.dart';
import 'package:rent_car_concept/widgets/map_card.dart';
import 'package:rent_car_concept/widgets/user_card.dart';

@RoutePage()
class CarDetailsPage extends StatefulWidget {
  const CarDetailsPage({
    super.key,
    required this.car,
  });

  final Car car;

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });
    _controller!.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller!.forward();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.firstGradient,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.car.brand} ${widget.car.model} ',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            const Icon(Icons.info),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppStyles.linearGradient,
        ),
        child: Column(
          children: [
            CarCard(
              car: widget.car,
              isDetailsPage: true,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: CarDetailsCard(widget: widget),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Expanded(
                    child: UserCard(),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                      child: MapCard(
                    animation: _animation,
                    car: widget.car,
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
