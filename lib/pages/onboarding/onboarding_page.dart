import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rent_car_concept/extensions/app_extensions.dart';
import 'package:rent_car_concept/pages/onboarding/onboarding_view.dart';
import 'package:rent_car_concept/router/app_router.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: [
            const OnboardingView(
              image: 'assets/car04.png',
              title: 'Premium cars',
              description: 'Drive in style with our luxury selection',
              // isFirstPage: true,
            ),
            const OnboardingView(
              image: 'assets/car02.png',
              title: 'Luxury at Lowest Prices',
              description: 'Experience comfort',
            ),
            OnboardingView(
              image: 'assets/car03.png',
              title: 'Easy booking',
              description: 'Book your car in just a few clicks',
              isLastPage: true,
              onLastPageSwipe: () =>
                  context.appRouter.replace(const CarListRoute()),
            ),
          ],
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 10,
                width: _currentPage == index ? 20 : 10,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? Colors.blueGrey
                      : Colors.blueGrey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
              );
            }),
          ),
        ),
      ],
    ));
  }
}
