import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

extension AppRouterExtension on BuildContext {
  StackRouter get appRouter => AutoRouter.of(this);
}
