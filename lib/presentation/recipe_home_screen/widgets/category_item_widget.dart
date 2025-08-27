import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/category_model.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryModel category;

  const CategoryItemWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 24.h),
      child: Column(
        children: [
          CustomImageView(
            imagePath: category.image ?? '',
            height: 76.h,
            width: 76.h,
            fit: BoxFit.cover,
            radius: BorderRadius.circular(38.h),
          ),
          SizedBox(height: 8.h),
          Text(
            category.title ?? '',
            style: TextStyleHelper.instance.body14MediumInter
                .copyWith(color: appTheme.gray_900_01, height: 1.21),
          ),
        ],
      ),
    );
  }
}
