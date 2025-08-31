import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/features/user/home/data/models/store_model.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart' show AppTextStyles;
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/widgets/custom_image_network.dart';

class CustomStoreDetailsDataWidget extends StatelessWidget {
  final StoreModel storeModel;
  const CustomStoreDetailsDataWidget({super.key, required this.storeModel});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          CustomImageNetwork(
            image: storeModel.logo,
            radiusValue: 12,
            widthImage: 97.w,
            heightImage: 87.h,
          ),
          widthSpace(14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  storeModel.name,
                  style: AppTextStyles.textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryColor,
                  ),
                ),
                Text(
                  storeModel.description ?? "",
                  style: AppTextStyles.textStyle12.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.rhinoDark.shade300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
