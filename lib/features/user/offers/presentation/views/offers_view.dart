import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/core/framework/spaces.dart';
import 'package:sanad/core/widgets/custom_image_network.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 24.w, top: 40.h),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Offers",
                    style: AppTextStyles.textStyle20.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              child: ListView.separated(itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColors.whiteColor,
                  ),
                  child: Row(
                    children: [
                      CustomImageNetwork(image: AppAssets.testImage,radiusValue: 12,widthImage: 90.w,heightImage: 90.h,),
                      widthSpace(16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text("store name",style: AppTextStyles.textStyle16.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.secondaryColor
                                  ),),
                                ),
                                Expanded(
                                  child: Text("10% off",style: AppTextStyles.textStyle14.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.secondaryColor
                                  ),),
                                ),
                              ],
                            ),
                            heightSpace(4),
                            Text("Thu, 27 Aug 2025",style: AppTextStyles.textStyle16.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.darkSecondaryColor
                            ),),

                          ],
                        ),
                      )
                    ],
                  ),
                );
              }, separatorBuilder: (context, index) {
                return heightSpace(16.h);
              }, itemCount: 4)
            ),
          ),
        ],
      ),
    );
  }
}
