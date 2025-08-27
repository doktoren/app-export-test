import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import './provider/checkout_provider.dart';
import './widgets/checkout_item_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<CheckoutProvider>(
      create: (context) => CheckoutProvider()..initialize(),
      child: const CheckoutScreen(),
    );
  }

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.white_A700,
        body: Consumer<CheckoutProvider>(
          builder: (context, provider, child) {
            // Show loading state if data is not ready
            if (provider.checkoutModel.items == null) {
              return Center(
                child: CircularProgressIndicator(
                  color: appTheme.black_900,
                ),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Column(
                      children: [
                        _buildHeader(),
                        _buildCheckoutOptions(),
                        _buildItemsSection(provider),
                        _buildPricingBreakdown(provider),
                      ],
                    ),
                  ),
                ),
                _buildBottomSection(provider),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
      decoration: BoxDecoration(
        color: appTheme.white_A700,
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray_300,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              NavigatorService.goBack();
            },
            child: Container(
              padding: EdgeInsets.all(4.h),
              child: Icon(
                Icons.chevron_left,
                size: 24.h,
                color: appTheme.black_900,
              ),
            ),
          ),
          Text(
            'Checkout',
            style: TextStyleHelper.instance.title17SemiBoldInter,
          ),
          SizedBox(width: 24.h),
        ],
      ),
    );
  }

  Widget _buildCheckoutOptions() {
    return Column(
      children: [
        _buildOptionRow(
          'SHIPPING',
          'Add shipping address',
          isGrayText: true,
        ),
        _buildDeliveryOption(),
        _buildOptionRow(
          'PAYMENT',
          'Visa *1234',
        ),
        _buildOptionRow(
          'PROMOS',
          'Apply promo code',
          isGrayText: true,
        ),
      ],
    );
  }

  Widget _buildOptionRow(String label, String value,
      {bool isGrayText = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.h),
      decoration: BoxDecoration(
        color: appTheme.white_A700,
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray_300,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyleHelper.instance.body12MediumInter,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                value,
                style: TextStyleHelper.instance.body14RegularInter.copyWith(
                    color: isGrayText ? appTheme.gray_600 : appTheme.black_900),
              ),
            ),
          ),
          SizedBox(width: 16.h),
          Icon(
            Icons.chevron_right,
            size: 20.h,
            color: appTheme.black_900,
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryOption() {
    return Container(
      padding: EdgeInsets.fromLTRB(16.h, 16.h, 16.h, 14.h),
      decoration: BoxDecoration(
        color: appTheme.white_A700,
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray_300,
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DELIVERY',
            style: TextStyleHelper.instance.body12MediumInter,
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Free',
                style: TextStyleHelper.instance.body14RegularInter
                    .copyWith(color: appTheme.black_900),
              ),
              Text(
                'Standard | 3-4 days',
                style: TextStyleHelper.instance.body14RegularInter
                    .copyWith(color: appTheme.black_900),
              ),
            ],
          ),
          SizedBox(width: 16.h),
          Icon(
            Icons.chevron_right,
            size: 20.h,
            color: appTheme.black_900,
          ),
        ],
      ),
    );
  }

  Widget _buildItemsSection(CheckoutProvider provider) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.h, 16.h, 16.h, 14.h),
      decoration: BoxDecoration(
        color: appTheme.white_A700,
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray_300,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'ITEMS',
                style: TextStyleHelper.instance.body12MediumInter,
              ),
              Spacer(),
              Text(
                'DESCRIPTION',
                style: TextStyleHelper.instance.body12MediumInter,
              ),
              Spacer(),
              Text(
                'PRICE',
                style: TextStyleHelper.instance.body12MediumInter,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          if (provider.checkoutModel.items?.isNotEmpty == true)
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: provider.checkoutModel.items!.length,
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemBuilder: (context, index) {
                return CheckoutItemWidget(
                  checkoutItemModel: provider.checkoutModel.items![index],
                );
              },
            )
          else
            Container(
              padding: EdgeInsets.all(20.h),
              child: Text(
                'No items in cart',
                style: TextStyleHelper.instance.body14RegularInter
                    .copyWith(color: appTheme.gray_600),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPricingBreakdown(CheckoutProvider provider) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.h, 16.h, 16.h, 20.h),
      child: Column(
        children: [
          _buildPriceRow(
            'Subtotal (${provider.checkoutModel.items?.length ?? 0})',
            provider.checkoutModel.subtotal ?? '\$0.00',
          ),
          SizedBox(height: 8.h),
          _buildPriceRow(
            'Shipping total',
            provider.checkoutModel.shippingTotal ?? 'Free',
          ),
          SizedBox(height: 8.h),
          _buildPriceRow(
            'Taxes',
            provider.checkoutModel.taxes ?? '\$0.00',
          ),
          SizedBox(height: 8.h),
          _buildPriceRow(
            'Total',
            provider.checkoutModel.total ?? '\$0.00',
            isBold: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isBold
              ? TextStyleHelper.instance.body14MediumInter
              : TextStyleHelper.instance.body14RegularInter,
        ),
        Text(
          value,
          style: isBold
              ? TextStyleHelper.instance.body14MediumInter
              : TextStyleHelper.instance.body14RegularInter,
        ),
      ],
    );
  }

  Widget _buildBottomSection(CheckoutProvider provider) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: appTheme.white_A700,
        border: Border(
          top: BorderSide(
            color: appTheme.gray_300,
            width: 1,
          ),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            provider.placeOrder();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: appTheme.black_900,
            foregroundColor: appTheme.white_A700,
            padding: EdgeInsets.symmetric(vertical: 16.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.h),
            ),
          ),
          child: Text(
            'Place order',
            style: TextStyleHelper.instance.body16SemiBoldInter
                .copyWith(color: appTheme.white_A700),
          ),
        ),
      ),
    );
  }
}
