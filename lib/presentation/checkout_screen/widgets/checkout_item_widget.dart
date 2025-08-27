import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/checkout_item_model.dart';

class CheckoutItemWidget extends StatelessWidget {
  final CheckoutItemModel checkoutItemModel;

  const CheckoutItemWidget({
    Key? key,
    required this.checkoutItemModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            height: 84.h,
            width: 84.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.h),
              color: appTheme.gray_100,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.h),
              child: checkoutItemModel.imagePath?.isNotEmpty == true
                  ? CustomImageView(
                      imagePath: checkoutItemModel.imagePath!,
                      height: 84.h,
                      width: 84.h,
                      fit: BoxFit.cover,
                    )
                  : Icon(
                      Icons.image,
                      size: 40.h,
                      color: appTheme.gray_600,
                    ),
            ),
          ),

          SizedBox(width: 14.h),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Info
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            checkoutItemModel.brand ?? '',
                            style: TextStyleHelper.instance.body12MediumInter
                                .copyWith(color: appTheme.gray_600),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            checkoutItemModel.productName ?? '',
                            style: TextStyleHelper.instance.body16SemiBoldInter,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            checkoutItemModel.description ?? '',
                            style: TextStyleHelper.instance.body12RegularInter,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 16.h),

                    // Quantity and Price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Qty: ${checkoutItemModel.quantity ?? '1'}',
                          style: TextStyleHelper.instance.body12RegularInter,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          checkoutItemModel.price ?? '\$0.00',
                          style: TextStyleHelper.instance.body16SemiBoldInter,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
