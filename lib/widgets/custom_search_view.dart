import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomSearchView - A reusable search input component with customizable styling and validation
 * 
 * Features:
 * - Configurable search icon and hint text
 * - Form validation support
 * - Responsive design with SizeUtils
 * - Theme-aware styling
 * - Built-in search functionality callbacks
 * 
 * @param controller - TextEditingController for managing input text
 * @param hintText - Placeholder text shown when field is empty
 * @param prefixIcon - Path to the search icon image
 * @param fillColor - Background color of the search field
 * @param validator - Validation function for form validation
 * @param onChanged - Callback triggered when text changes
 * @param onFieldSubmitted - Callback triggered when search is submitted
 * @param enabled - Whether the search field is enabled for input
 */
class CustomSearchView extends StatelessWidget {
  CustomSearchView({
    Key? key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.fillColor,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.enabled,
  }) : super(key: key);

  /// Controller for managing the text input
  final TextEditingController? controller;

  /// Hint text displayed when the field is empty
  final String? hintText;

  /// Path to the prefix icon image
  final String? prefixIcon;

  /// Background color of the search field
  final Color? fillColor;

  /// Validation function for form validation
  final String? Function(String?)? validator;

  /// Callback function triggered when text changes
  final Function(String)? onChanged;

  /// Callback function triggered when search is submitted
  final Function(String)? onFieldSubmitted;

  /// Whether the search field is enabled
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 8.h,
      ),
      child: TextFormField(
        controller: controller,
        enabled: enabled ?? true,
        keyboardType: TextInputType.text,
        validator: validator,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        style:
            TextStyleHelper.instance.title16RegularInter.copyWith(height: 1.25),
        decoration: InputDecoration(
          hintText: hintText ?? 'Search',
          hintStyle: TextStyleHelper.instance.title16RegularInter
              .copyWith(height: 1.25),
          prefixIcon: Container(
            width: 24.h,
            height: 24.h,
            padding: EdgeInsets.all(12.h),
            child: CustomImageView(
              imagePath: prefixIcon ?? ImageConstant.imgSearch,
              height: 24.h,
              width: 24.h,
            ),
          ),
          filled: true,
          fillColor: fillColor ?? Color(0xFFF5F5F5),
          contentPadding: EdgeInsets.only(
            top: 8.h,
            right: 12.h,
            bottom: 8.h,
            left: 36.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.h),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.h),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.h),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.h),
            borderSide: BorderSide(
              color: appTheme.redCustom,
              width: 1.h,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.h),
            borderSide: BorderSide(
              color: appTheme.redCustom,
              width: 1.h,
            ),
          ),
          isDense: true,
        ),
      ),
    );
  }
}
