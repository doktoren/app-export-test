import 'package:flutter/material.dart';
import '../core/app_export.dart';

/**
 * CustomButton - A reusable button component with customizable styling
 * 
 * Features:
 * - Configurable text, colors, and dimensions
 * - Responsive design with SizeUtils
 * - Shadow effects and rounded corners
 * - Flexible width behavior
 * - Loading and disabled states support
 * 
 * @param text - Button text to display
 * @param onPressed - Callback function when button is pressed
 * @param backgroundColor - Background color of the button
 * @param textColor - Text color of the button
 * @param borderRadius - Border radius for rounded corners
 * @param padding - Internal padding of the button
 * @param isFlexible - Whether button should take flexible width
 * @param elevation - Shadow elevation of the button
 * @param fontSize - Font size of the button text
 * @param fontWeight - Font weight of the button text
 * @param isLoading - Whether to show loading indicator
 * @param isEnabled - Whether button is enabled or disabled
 */
class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.padding,
    this.isFlexible,
    this.elevation,
    this.fontSize,
    this.fontWeight,
    this.isLoading,
    this.isEnabled,
  }) : super(key: key);

  /// Text to display on the button
  final String text;

  /// Callback function when button is pressed
  final VoidCallback? onPressed;

  /// Background color of the button
  final Color? backgroundColor;

  /// Text color of the button
  final Color? textColor;

  /// Border radius for rounded corners
  final double? borderRadius;

  /// Internal padding of the button
  final EdgeInsets? padding;

  /// Whether button should take flexible width
  final bool? isFlexible;

  /// Shadow elevation of the button
  final double? elevation;

  /// Font size of the button text
  final double? fontSize;

  /// Font weight of the button text
  final FontWeight? fontWeight;

  /// Whether to show loading indicator
  final bool? isLoading;

  /// Whether button is enabled or disabled
  final bool? isEnabled;

  @override
  Widget build(BuildContext context) {
    final bool loading = isLoading ?? false;
    final bool enabled = (isEnabled ?? true) && !loading;
    final bool flexible = isFlexible ?? true;

    Widget button = ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Color(0xFF000000),
        foregroundColor: textColor ?? Color(0xFFFFFFFF),
        elevation: elevation ?? 1.0,
        shadowColor: appTheme.color0C0000,
        padding: padding ??
            EdgeInsets.symmetric(
              vertical: 14.h,
              horizontal: 30.h,
            ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.h),
        ),
        minimumSize: Size(0, 48.h),
      ),
      child: loading
          ? SizedBox(
              height: 20.h,
              width: 20.h,
              child: CircularProgressIndicator(
                strokeWidth: 2.h,
                valueColor: AlwaysStoppedAnimation<Color>(
                  textColor ?? Color(0xFFFFFFFF),
                ),
              ),
            )
          : Text(
              text,
              style: TextStyle(
                fontSize: fontSize ?? 16.fSize,
                fontWeight: fontWeight ?? FontWeight.w500,
                fontFamily: 'Inter',
                height: 1.25,
              ),
            ),
    );

    return flexible ? Expanded(child: button) : button;
  }
}
