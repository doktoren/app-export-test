import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/product_model.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductModel product;

  const ProductCardWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148.h,
      margin: EdgeInsets.only(right: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: product.image ?? '',
            height: 148.h,
            width: 148.h,
            fit: BoxFit.cover,
            radius: BorderRadius.circular(8.h),
          ),
          SizedBox(height: 12.h),
          Text(
            product.brand ?? '',
            style: TextStyleHelper.instance.body12RegularInter
                .copyWith(height: 1.25),
          ),
          Text(
            product.name ?? '',
            style: TextStyleHelper.instance.body14RegularInter
                .copyWith(color: appTheme.black_900, height: 1.21),
          ),
          Text(
            '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
            style: TextStyleHelper.instance.title16MediumInter
                .copyWith(height: 1.25),
          ),
        ],
      ),
    );
  }
}
