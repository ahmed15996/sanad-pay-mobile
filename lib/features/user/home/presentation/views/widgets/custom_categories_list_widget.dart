import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/features/user/home/data/models/category_model.dart';
import 'package:sanad/features/user/home/presentation/views/widgets/custom_category_item_widget.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/widgets/custom_image_network.dart';

class CustomCategoriesListWidget extends StatelessWidget {
  final List<CategoryModel> categories;
  const CustomCategoriesListWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 76.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomCategoryItemWidget(categoryModel: categories[index]);
        },
        separatorBuilder: (context, index) {
          return widthSpace(16);
        },
        itemCount: categories.length,
      ),
    );
  }
}
