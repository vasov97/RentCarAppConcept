import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_car_concept/provider/favorites_provider.dart';
import 'package:rent_car_concept/theme/colors/app_colors.dart';
import 'package:rent_car_concept/theme/styles/app_styles.dart';
import 'package:rent_car_concept/widgets/car_card.dart';

@RoutePage()
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoritesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.firstGradient,
        title: const Text('Favorites'),
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: AppStyles.linearGradient),
        child: Consumer<FavoritesProvider>(
            builder: (context, favoritesProvider, child) {
          if (favoritesProvider.favorites.isEmpty) {
            return const Center(
              child: Text('No favorite cars added yet.'),
            );
          }
          return ListView.builder(
            itemCount: provider.favorites.length,
            itemBuilder: (context, index) {
              final car = favoritesProvider.favorites[index];
              return CarCard(
                car: car,
                isDetailsPage: true,
              );
            },
          );
        }),
      ),
    );
  }
}
