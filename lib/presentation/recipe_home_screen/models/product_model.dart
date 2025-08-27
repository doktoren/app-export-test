class ProductModel {
  String? id;
  String? image;
  String? brand;
  String? name;
  double? price;

  ProductModel({
    this.id,
    this.image,
    this.brand,
    this.name,
    this.price,
  }) {
    id = id ?? '';
    image = image ?? '';
    brand = brand ?? '';
    name = name ?? '';
    price = price ?? 0.0;
  }
}
