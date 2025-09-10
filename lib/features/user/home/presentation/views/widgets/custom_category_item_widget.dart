import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/features/user/home/data/models/category_model.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/widgets/custom_image_network.dart';

class CustomCategoryItemWidget extends StatelessWidget {
  final CategoryModel categoryModel;
  const CustomCategoryItemWidget({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImageNetwork(
          image: categoryModel.image,
          widthImage: 50,
          heightImage: 50,
          radiusValue: 25,
        ),
        heightSpace(4),
        Text(categoryModel.name,
            maxLines: 1,
            style: AppTextStyles.textStyle12.copyWith(
          color: AppColors.blackColor,
        )),
      ],
    );
  }
}
