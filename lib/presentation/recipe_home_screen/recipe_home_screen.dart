import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_image_view.dart';
import './provider/recipe_home_provider.dart';
import './recipe_home_initial_page.dart';

class RecipeHomeScreen extends StatefulWidget {
  const RecipeHomeScreen({Key? key}) : super(key: key);

  @override
  RecipeHomeScreenState createState() => RecipeHomeScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeHomeProvider(),
      child: RecipeHomeScreen(),
    );
  }
}

class RecipeHomeScreenState extends State<RecipeHomeScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.recipeHomeScreenInitialPage,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (ctx, a1, a2) =>
                getCurrentPage(context, routeSetting.name!),
            transitionDuration: Duration(seconds: 0),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.maxFinite,
        child: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.white_A700,
        boxShadow: [
          BoxShadow(
            color: appTheme.color888888,
            blurRadius: 20.h,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 12.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              navigatorKey.currentState
                  ?.pushNamed(AppRoutes.recipeHomeScreenInitialPage);
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgIcontabHomefill,
              height: 24.h,
              width: 24.h,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgIcontabDiscover,
            height: 24.h,
            width: 24.h,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgIconmonstrshoppingcart21,
            height: 24.h,
            width: 24.h,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgIcon3ptBell,
            height: 24.h,
            width: 24.h,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgIconPerson,
            height: 24.h,
            width: 24.h,
          ),
        ],
      ),
    );
  }

  Widget getCurrentPage(BuildContext context, String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.recipeHomeScreenInitialPage:
        return RecipeHomeInitialPage.builder(context);
      default:
        return Container();
    }
  }
}
