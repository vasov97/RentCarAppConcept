import 'package:flutter/material.dart';
import 'package:rent_car_concept/extensions/app_extensions.dart';
import 'package:rent_car_concept/router/app_router.dart';
import 'package:rent_car_concept/theme/colors/app_colors.dart';
import 'package:rent_car_concept/theme/icons/app_icons.dart';
import 'package:rent_car_concept/theme/styles/app_styles.dart';

class OnboardingView extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final bool isLastPage;
  final bool isFirstPage;
  final VoidCallback? onLastPageSwipe;

  const OnboardingView({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    this.isLastPage = false,
    this.isFirstPage = false,
    this.onLastPageSwipe,
  });

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppStyles.linearGradient,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: widget.isFirstPage ? BoxFit.cover : BoxFit.contain,
                ),
              ),
            ),
          ),
          widget.isLastPage
              ? const SizedBox.shrink()
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: -300, end: 0),
                          duration: const Duration(milliseconds: 1200),
                          builder: (context, value, child) {
                            return Transform.translate(
                              offset: Offset(value, 0),
                              child: child,
                            );
                          },
                          child: Text(
                            widget.title.toUpperCase(),
                            style: const TextStyle(
                              color: AppColors.lightGrey,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 300, end: 0),
                          duration: const Duration(milliseconds: 1000),
                          builder: (context, value, child) {
                            return Transform.translate(
                              offset: Offset(value, 0),
                              child: child,
                            );
                          },
                          child: Text(
                            widget.description,
                            style: const TextStyle(
                              color: AppColors.lightGrey,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: widget.isLastPage ? 0 : 50,
                        ),
                      ],
                    ),
                  ),
                ),
          widget.isLastPage
              ? Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () =>
                            context.appRouter.push(const CarListRoute()),
                        child: const Row(
                          children: [
                            Text(
                              'Start Exploring',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                            AppIcons.arrowForward,
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
