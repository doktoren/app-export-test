import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/image_constant.dart';
import '../models/checkout_item_model.dart';
import '../models/checkout_model.dart';

class CheckoutProvider extends ChangeNotifier {
  CheckoutModel _checkoutModel = CheckoutModel();

  CheckoutModel get checkoutModel => _checkoutModel;

  void initialize() {
    try {
      _checkoutModel = CheckoutModel(
        items: [
          CheckoutItemModel(
            imagePath: ImageConstant.imgImage84x84,
            brand: 'Brand',
            productName: 'Product name',
            description: 'Description',
            quantity: '01',
            price: '\$10.99',
          ),
          CheckoutItemModel(
            imagePath: ImageConstant.imgImage8,
            brand: 'Brand',
            productName: 'Product name',
            description: 'Description',
            quantity: '01',
            price: '\$8.99',
          ),
        ],
        subtotal: '\$19.98',
        shippingTotal: 'Free',
        taxes: '\$2.00',
        total: '\$21.98',
      );
      notifyListeners();
    } catch (e) {
      print('Error initializing CheckoutProvider: $e');
      // Initialize with empty data as fallback
      _checkoutModel = CheckoutModel(
        items: [],
        subtotal: '\$0.00',
        shippingTotal: 'Free',
        taxes: '\$0.00',
        total: '\$0.00',
      );
      notifyListeners();
    }
  }

  void placeOrder() {
    try {
      // Handle place order functionality
      print('Order placed successfully');
      // Add your order placement logic here
      // Navigate to order confirmation screen if needed
    } catch (e) {
      print('Error placing order: $e');
    }
  }
}
