import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomBottomBar - A reusable bottom navigation bar component
 * 
 * Features:
 * - Supports multiple navigation items with icons
 * - Active/inactive state management
 * - Box shadow styling
 * - Responsive design using SizeUtils
 * - Route-based navigation support
 * 
 * @param bottomBarItemList - List of navigation items
 * @param selectedIndex - Currently selected navigation index
 * @param onChanged - Callback function for navigation item selection
 */
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    required this.bottomBarItemList,
    required this.onChanged,
    this.selectedIndex = 0,
  }) : super(key: key);

  /// List of bottom bar navigation items
  final List<CustomBottomBarItem> bottomBarItemList;

  /// Currently selected navigation index
  final int selectedIndex;

  /// Callback function triggered when navigation item is tapped
  final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 14.h,
              vertical: 12.h,
            ),
            child: Container(
              margin: EdgeInsets.only(bottom: 30.h),
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  bottomBarItemList.length,
                  (index) => _buildNavigationItem(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds individual navigation item
  Widget _buildNavigationItem(int index) {
    final item = bottomBarItemList[index];
    final isSelected = selectedIndex == index;

    return InkWell(
      onTap: () => onChanged(index),
      borderRadius: BorderRadius.circular(12.h),
      child: Container(
        padding: EdgeInsets.all(8.h),
        child: CustomImageView(
          imagePath: isSelected && item.activeIcon != null
              ? item.activeIcon!
              : item.icon,
          height: 24.h,
          width: 24.h,
        ),
      ),
    );
  }
}

/// Data model for bottom navigation bar items
class CustomBottomBarItem {
  CustomBottomBarItem({
    required this.icon,
    this.activeIcon,
    required this.routeName,
    this.title,
  });

  /// Path to the default/inactive icon
  final String icon;

  /// Path to the active state icon (optional)
  final String? activeIcon;

  /// Route name for navigation
  final String routeName;

  /// Optional title for the navigation item
  final String? title;
}
