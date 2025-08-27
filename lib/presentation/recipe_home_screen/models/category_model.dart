class CategoryModel {
  String? id;
  String? image;
  String? title;

  CategoryModel({
    this.id,
    this.image,
    this.title,
  }) {
    id = id ?? '';
    image = image ?? '';
    title = title ?? '';
  }
}
