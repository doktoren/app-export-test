import './checkout_item_model.dart';

class CheckoutModel {
  List<CheckoutItemModel>? items;
  String? subtotal;
  String? shippingTotal;
  String? taxes;
  String? total;

  CheckoutModel({
    this.items,
    this.subtotal,
    this.shippingTotal,
    this.taxes,
    this.total,
  }) {
    items = items ?? [];
    subtotal = subtotal ?? '\$0.00';
    shippingTotal = shippingTotal ?? 'Free';
    taxes = taxes ?? '\$0.00';
    total = total ?? '\$0.00';
  }

  CheckoutModel copyWith({
    List<CheckoutItemModel>? items,
    String? subtotal,
    String? shippingTotal,
    String? taxes,
    String? total,
  }) {
    return CheckoutModel(
      items: items ?? this.items,
      subtotal: subtotal ?? this.subtotal,
      shippingTotal: shippingTotal ?? this.shippingTotal,
      taxes: taxes ?? this.taxes,
      total: total ?? this.total,
    );
  }
}
