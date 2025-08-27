import 'package:flutter/material.dart';
import '../presentation/recipe_home_screen/recipe_home_screen.dart';
import '../presentation/checkout_screen/checkout_screen.dart';

import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String recipeHomeScreen = '/recipe_home_screen';
  static const String recipeHomeScreenInitialPage =
      '/recipe_home_screen_initial_page';
  static const String checkoutScreen = '/checkout_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/';

  static Map<String, WidgetBuilder> get routes => {
        recipeHomeScreen: RecipeHomeScreen.builder,
        checkoutScreen: CheckoutScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: AppNavigationScreen.builder
      };
}
