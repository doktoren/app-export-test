class CheckoutItemModel {
  String? imagePath;
  String? brand;
  String? productName;
  String? description;
  String? quantity;
  String? price;

  CheckoutItemModel({
    this.imagePath,
    this.brand,
    this.productName,
    this.description,
    this.quantity,
    this.price,
  }) {
    imagePath = imagePath ?? '';
    brand = brand ?? '';
    productName = productName ?? '';
    description = description ?? '';
    quantity = quantity ?? '';
    price = price ?? '';
  }

  CheckoutItemModel copyWith({
    String? imagePath,
    String? brand,
    String? productName,
    String? description,
    String? quantity,
    String? price,
  }) {
    return CheckoutItemModel(
      imagePath: imagePath ?? this.imagePath,
      brand: brand ?? this.brand,
      productName: productName ?? this.productName,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }
}
