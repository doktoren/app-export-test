import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_search_view.dart';
import './provider/recipe_home_provider.dart';
import './widgets/category_item_widget.dart';
import './widgets/product_card_widget.dart';

// Modified: Fixed import path

class RecipeHomeInitialPage extends StatelessWidget {
  const RecipeHomeInitialPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return RecipeHomeInitialPage();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeHomeProvider>(
      builder: (context, provider, child) {
        return Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.white_A700,
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildSearchSection(context),
                      _buildCategoriesSection(context, provider),
                      _buildBannerSection(context, provider),
                      _buildFirstTitleSection(context),
                      _buildCircularCategoriesSection(context, provider),
                      _buildSecondTitleSection(context),
                      _buildProductsSection(context, provider),
                      _buildThirdTitleSection(context),
                      _buildHorizontalImagesSection(context, provider),
                      SizedBox(height: 32.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSearchSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.h, 8.h, 16.h, 0),
      child: CustomSearchView(
        hintText: 'Search',
        prefixIcon: ImageConstant.imgSearch,
        fillColor: appTheme.gray_100,
      ),
    );
  }

  Widget _buildCategoriesSection(
      BuildContext context, RecipeHomeProvider provider) {
    return Container(
      margin: EdgeInsets.only(top: 8.h, left: 16.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
              decoration: BoxDecoration(
                border: Border.all(color: appTheme.gray_300),
                borderRadius: BorderRadius.circular(6.h),
              ),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgIconFavorite,
                    height: 18.h,
                    width: 18.h,
                  ),
                  SizedBox(width: 4.h),
                  Text(
                    'Favorites',
                    style: TextStyleHelper.instance.body14MediumInter
                        .copyWith(color: appTheme.colorE50000, height: 1.21),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
              margin: EdgeInsets.only(left: 8.h),
              decoration: BoxDecoration(
                border: Border.all(color: appTheme.gray_300),
                borderRadius: BorderRadius.circular(6.h),
              ),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgIconHistory,
                    height: 18.h,
                    width: 18.h,
                  ),
                  SizedBox(width: 4.h),
                  Text(
                    'History',
                    style: TextStyleHelper.instance.body14MediumInter
                        .copyWith(height: 1.21),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
              margin: EdgeInsets.only(left: 8.h),
              decoration: BoxDecoration(
                border: Border.all(color: appTheme.gray_300),
                borderRadius: BorderRadius.circular(6.h),
              ),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgIconFollowing,
                    height: 18.h,
                    width: 18.h,
                  ),
                  SizedBox(width: 4.h),
                  Text(
                    'Following',
                    style: TextStyleHelper.instance.body14MediumInter
                        .copyWith(height: 1.21),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
              margin: EdgeInsets.only(left: 8.h),
              decoration: BoxDecoration(
                border: Border.all(color: appTheme.gray_300),
                borderRadius: BorderRadius.circular(6.h),
              ),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgIconOrder,
                    height: 18.h,
                    width: 18.h,
                  ),
                  SizedBox(width: 4.h),
                  Text(
                    'Orders',
                    style: TextStyleHelper.instance.body14MediumInter
                        .copyWith(height: 1.21),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBannerSection(
      BuildContext context, RecipeHomeProvider provider) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.h, 16.h, 16.h, 0),
      height: 136.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.maxFinite,
            height: 136.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.h),
              image: DecorationImage(
                image: AssetImage(ImageConstant.img),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.only(left: 20.h, top: 54.h, bottom: 54.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Banner title',
                  style: TextStyleHelper.instance.title20SemiBoldInter
                      .copyWith(height: 1.25),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 8.h,
                  width: 8.h,
                  decoration: BoxDecoration(
                    color: appTheme.black_900,
                    borderRadius: BorderRadius.circular(4.h),
                  ),
                ),
                SizedBox(width: 4.h),
                Container(
                  height: 8.h,
                  width: 8.h,
                  decoration: BoxDecoration(
                    color: appTheme.colorFFCCCC,
                    borderRadius: BorderRadius.circular(4.h),
                  ),
                ),
                SizedBox(width: 4.h),
                Container(
                  height: 8.h,
                  width: 8.h,
                  decoration: BoxDecoration(
                    color: appTheme.colorFFCCCC,
                    borderRadius: BorderRadius.circular(4.h),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFirstTitleSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.h, 24.h, 16.h, 0),
      child: Row(
        children: [
          Text(
            'Title',
            style: TextStyleHelper.instance.title16SemiBoldInter
                .copyWith(height: 1.25),
          ),
          SizedBox(width: 10.h),
          CustomIconButton(
            iconPath: ImageConstant.imgArrowRight,
            height: 20.h,
            width: 20.h,
            padding: EdgeInsets.all(2.h),
            backgroundColor: appTheme.gray_100,
            borderRadius: 10.h,
          ),
        ],
      ),
    );
  }

  Widget _buildCircularCategoriesSection(
      BuildContext context, RecipeHomeProvider provider) {
    return Container(
      margin: EdgeInsets.only(top: 16.h, left: 16.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: provider.categories.map((category) {
            return CategoryItemWidget(category: category);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildSecondTitleSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.h, 32.h, 16.h, 0),
      child: Row(
        children: [
          Text(
            'Title',
            style: TextStyleHelper.instance.title16SemiBoldInter
                .copyWith(height: 1.25),
          ),
          SizedBox(width: 10.h),
          CustomIconButton(
            iconPath: ImageConstant.imgArrowRight,
            height: 20.h,
            width: 20.h,
            padding: EdgeInsets.all(2.h),
            backgroundColor: appTheme.gray_100,
            borderRadius: 10.h,
          ),
        ],
      ),
    );
  }

  Widget _buildProductsSection(
      BuildContext context, RecipeHomeProvider provider) {
    return Container(
      margin: EdgeInsets.only(top: 16.h, left: 16.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: provider.products.map((product) {
            return ProductCardWidget(product: product);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildThirdTitleSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.h, 32.h, 16.h, 0),
      child: Row(
        children: [
          Text(
            'Title',
            style: TextStyleHelper.instance.title16SemiBoldInter
                .copyWith(height: 1.25),
          ),
          SizedBox(width: 10.h),
          CustomIconButton(
            iconPath: ImageConstant.imgArrowRight,
            height: 20.h,
            width: 20.h,
            padding: EdgeInsets.all(2.h),
            backgroundColor: appTheme.gray_100,
            borderRadius: 10.h,
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalImagesSection(
      BuildContext context, RecipeHomeProvider provider) {
    return Container(
      margin: EdgeInsets.only(top: 16.h, left: 16.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgImage96x96,
              height: 96.h,
              width: 96.h,
            ),
            SizedBox(width: 12.h),
            CustomImageView(
              imagePath: ImageConstant.imgImage5,
              height: 96.h,
              width: 96.h,
            ),
            SizedBox(width: 12.h),
            CustomImageView(
              imagePath: ImageConstant.imgImage6,
              height: 96.h,
              width: 96.h,
            ),
            SizedBox(width: 12.h),
            CustomImageView(
              imagePath: ImageConstant.imgImage7,
              height: 96.h,
              width: 96.h,
            ),
          ],
        ),
      ),
    );
  }
}
