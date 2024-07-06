import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rent_car_concept/models/car.dart';
import 'package:rent_car_concept/pages/car_details_page.dart';
import 'package:rent_car_concept/pages/car_list_page.dart';
import 'package:rent_car_concept/pages/favorites_page.dart';
import 'package:rent_car_concept/pages/maps_details_page.dart';
import 'package:rent_car_concept/pages/onboarding/onboarding_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnboardingRoute.page, initial: true),
        AutoRoute(page: CarListRoute.page),
        AutoRoute(page: CarDetailsRoute.page),
        AutoRoute(page: MapsDetailsRoute.page),
        AutoRoute(page: FavoritesRoute.page),
      ];
}
