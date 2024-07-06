// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CarDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CarDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CarDetailsPage(
          key: args.key,
          car: args.car,
        ),
      );
    },
    CarListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CarListPage(),
      );
    },
    FavoritesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoritesPage(),
      );
    },
    MapsDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MapsDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MapsDetailsPage(
          key: args.key,
          car: args.car,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingPage(),
      );
    },
  };
}

/// generated route for
/// [CarDetailsPage]
class CarDetailsRoute extends PageRouteInfo<CarDetailsRouteArgs> {
  CarDetailsRoute({
    Key? key,
    required Car car,
    List<PageRouteInfo>? children,
  }) : super(
          CarDetailsRoute.name,
          args: CarDetailsRouteArgs(
            key: key,
            car: car,
          ),
          initialChildren: children,
        );

  static const String name = 'CarDetailsRoute';

  static const PageInfo<CarDetailsRouteArgs> page =
      PageInfo<CarDetailsRouteArgs>(name);
}

class CarDetailsRouteArgs {
  const CarDetailsRouteArgs({
    this.key,
    required this.car,
  });

  final Key? key;

  final Car car;

  @override
  String toString() {
    return 'CarDetailsRouteArgs{key: $key, car: $car}';
  }
}

/// generated route for
/// [CarListPage]
class CarListRoute extends PageRouteInfo<void> {
  const CarListRoute({List<PageRouteInfo>? children})
      : super(
          CarListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CarListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FavoritesPage]
class FavoritesRoute extends PageRouteInfo<void> {
  const FavoritesRoute({List<PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MapsDetailsPage]
class MapsDetailsRoute extends PageRouteInfo<MapsDetailsRouteArgs> {
  MapsDetailsRoute({
    Key? key,
    required Car car,
    List<PageRouteInfo>? children,
  }) : super(
          MapsDetailsRoute.name,
          args: MapsDetailsRouteArgs(
            key: key,
            car: car,
          ),
          initialChildren: children,
        );

  static const String name = 'MapsDetailsRoute';

  static const PageInfo<MapsDetailsRouteArgs> page =
      PageInfo<MapsDetailsRouteArgs>(name);
}

class MapsDetailsRouteArgs {
  const MapsDetailsRouteArgs({
    this.key,
    required this.car,
  });

  final Key? key;

  final Car car;

  @override
  String toString() {
    return 'MapsDetailsRouteArgs{key: $key, car: $car}';
  }
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
