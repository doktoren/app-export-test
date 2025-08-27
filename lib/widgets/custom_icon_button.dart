import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * A customizable icon button widget with configurable styling and behavior.
 * 
 * This widget provides a flexible IconButton implementation with support for:
 * - Custom icon paths (SVG, PNG, network images)
 * - Configurable background colors and shapes
 * - Adjustable padding, margins, and dimensions
 * - Custom border radius and styling
 * - Tap callback handling
 * 
 * @param iconPath - Path to the icon image (required)
 * @param onTap - Callback function when button is tapped
 * @param backgroundColor - Background color of the button
 * @param borderRadius - Border radius for rounded corners
 * @param padding - Internal padding around the icon
 * @param margin - External margin around the button
 * @param width - Width of the button
 * @param height - Height of the button
 * @param iconSize - Size of the icon within the button
 */
class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.iconPath,
    this.onTap,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.iconSize,
  }) : super(key: key);

  /// Path to the icon image (SVG, PNG, network, etc.)
  final String iconPath;

  /// Callback function triggered when button is tapped
  final VoidCallback? onTap;

  /// Background color of the button
  final Color? backgroundColor;

  /// Border radius for rounded corners
  final double? borderRadius;

  /// Internal padding around the icon
  final EdgeInsets? padding;

  /// External margin around the button
  final EdgeInsets? margin;

  /// Width of the button container
  final double? width;

  /// Height of the button container
  final double? height;

  /// Size of the icon within the button
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 20.h,
      height: height ?? 20.h,
      margin: margin ?? EdgeInsets.only(left: 10.h),
      decoration: BoxDecoration(
        color: backgroundColor ?? Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(borderRadius ?? 10.h),
      ),
      child: Material(
        color: appTheme.transparentCustom,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.h),
          onTap: onTap,
          child: Padding(
            padding: padding ?? EdgeInsets.all(2.h),
            child: CustomImageView(
              imagePath: iconPath,
              width: iconSize ?? (width ?? 20.h) - (padding?.horizontal ?? 4.h),
              height: iconSize ?? (height ?? 20.h) - (padding?.vertical ?? 4.h),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
