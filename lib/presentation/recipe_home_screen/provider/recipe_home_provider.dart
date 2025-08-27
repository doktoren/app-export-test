import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/image_constant.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';
import '../models/recipe_home_model.dart';

class RecipeHomeProvider extends ChangeNotifier {
  RecipeHomeModel recipeHomeModel = RecipeHomeModel();

  List<CategoryModel> _categories = [];
  List<ProductModel> _products = [];
  bool _isLoading = false;

  List<CategoryModel> get categories => _categories;
  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;

  RecipeHomeProvider() {
    initialize();
  }

  void initialize() {
    _initializeCategories();
    _initializeProducts();
  }

  void _initializeCategories() {
    _categories = [
      CategoryModel(
        id: '1',
        image: ImageConstant.imgImage,
        title: 'Title',
      ),
      CategoryModel(
        id: '2',
        image: ImageConstant.imgImage76x76,
        title: 'Title',
      ),
      CategoryModel(
        id: '3',
        image: ImageConstant.imgImage1,
        title: 'Title',
      ),
      CategoryModel(
        id: '4',
        image: ImageConstant.imgImage2,
        title: 'Title',
      ),
    ];
  }

  void _initializeProducts() {
    _products = [
      ProductModel(
        id: '1',
        image: ImageConstant.imgImage148x148,
        brand: 'Brand',
        name: 'Product name',
        price: 10.99,
      ),
      ProductModel(
        id: '2',
        image: ImageConstant.imgImage3,
        brand: 'Brand',
        name: 'Product name',
        price: 10.99,
      ),
      ProductModel(
        id: '3',
        image: ImageConstant.imgImage4,
        brand: 'Brand',
        name: 'Product name',
        price: 10.99,
      ),
    ];
  }

  void onCategoryTap(CategoryModel category) {
    notifyListeners();
  }

  void onProductTap(ProductModel product) {
    notifyListeners();
  }
}
