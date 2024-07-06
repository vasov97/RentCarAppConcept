import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rent_car_concept/config/constants.dart';
import 'package:rent_car_concept/router/app_router.dart';
import 'package:rent_car_concept/theme/colors/app_colors.dart';
import 'package:rent_car_concept/theme/styles/app_styles.dart';
import 'package:rent_car_concept/widgets/car_card.dart';

@RoutePage()
class CarListPage extends StatelessWidget {
  const CarListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.firstGradient,
        actions: [
          IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () => context.router.push(const FavoritesRoute())),
        ],
        centerTitle: true,
        title: const Text(
          'Choose Your Car',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: AppStyles.linearGradient,
            ),
          ),
          ListView.builder(
            itemCount: cars.length,
            itemBuilder: (context, index) {
              return CarCard(car: cars[index]);
            },
          ),
        ],
      ),
    );
  }
}
