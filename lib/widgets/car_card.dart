import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_car_concept/extensions/app_extensions.dart';
import 'package:rent_car_concept/models/car.dart';
import 'package:rent_car_concept/provider/favorites_provider.dart';
import 'package:rent_car_concept/router/app_router.dart';
import 'package:rent_car_concept/theme/icons/app_icons.dart';
import 'package:rent_car_concept/theme/styles/app_styles.dart';
import 'package:rent_car_concept/theme/typography/app_typography.dart';
import 'package:rent_car_concept/widgets/car_details_row.dart';

class CarCard extends StatelessWidget {
  const CarCard({
    super.key,
    required this.car,
    this.isDetailsPage = false,
  });

  final Car car;
  final bool isDetailsPage;

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    return GestureDetector(
      onTap: () => context.appRouter.push(CarDetailsRoute(
        car: car,
      )),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: AppStyles.carCardDecoration,
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    AppIcons.star,
                    Text(
                      car.rating.toString(),
                      style: AppTypography.font18,
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      car.isAvailable ? "Available" : "Not Available",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: car.isAvailable ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Image.asset(
              car.imagePath,
              height: 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${car.brand} ${car.model}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                isDetailsPage
                    ? IconButton(
                        onPressed: () {
                          if (!favoritesProvider.isFavorite(car.id)) {
                            favoritesProvider.addFavorite(car);
                          } else {
                            favoritesProvider.removeFavorite(car.id);
                          }
                        },
                        icon: Icon(
                          favoritesProvider.isFavorite(car.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: favoritesProvider.isFavorite(car.id)
                              ? Colors.red
                              : Colors.grey,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            isDetailsPage ? const SizedBox.shrink() : CarDetailsRow(car: car),
          ],
        ),
      ),
    );
  }
}
