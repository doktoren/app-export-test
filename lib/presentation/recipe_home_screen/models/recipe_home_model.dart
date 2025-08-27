class RecipeHomeModel {
  String? searchQuery;
  int? selectedCategoryIndex;
  int? currentBannerIndex;

  RecipeHomeModel({
    this.searchQuery,
    this.selectedCategoryIndex,
    this.currentBannerIndex,
  }) {
    searchQuery = searchQuery ?? '';
    selectedCategoryIndex = selectedCategoryIndex ?? 0;
    currentBannerIndex = currentBannerIndex ?? 0;
  }
}
