import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/widgets/custom_appbar.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/widgets/custom_image_network.dart';

class StoreDetailsView extends StatelessWidget {
  const StoreDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Store Details"),
      body: Column(
        children: [
          Row(
            children: [
              CustomImageNetwork(
                image: AppAssets.testImage,
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
                      "store name",
                      style: AppTextStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    Text(
                      "A store that sells all household needs, including groceries, fruits, and vegetables",
                      style: AppTextStyles.textStyle12.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              widthSpace(87.w),
              Text(
                "Open Map",
                style: AppTextStyles.textStyle12.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 16.w),
            child: Divider(
              thickness: 3,
              color: AppColors.hintColor,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppAssets.clock),
              widthSpace(12.w),
              Expanded(child: Column(
                children: [
                  Text("Woking Time",style: AppTextStyles.textStyle14.copyWith(
                    fontWeight: FontWeight.bold,
                  ),),
                  heightSpace(4),
    Text("Open Now Till 11:59PM",style: AppTextStyles.textStyle12.copyWith(
    fontWeight: FontWeight.w500,
      color: AppColors.hintColor
    ),),

                ],
              )),
              Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.primaryColor,)


            ],
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 16.w),
            child: Divider(
              thickness: 3,
              color: AppColors.hintColor,
            ),
          ),
          Text("Offers",style: AppTextStyles.textStyle20.copyWith(
            fontWeight: FontWeight.w600,
          ),),
          heightSpace(16),
          ListView.separated(itemBuilder: (context, index) {
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
                        ),),heightSpace(4),
                        Text("150 SAR",style: AppTextStyles.textStyle16.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.greenColor
                        ),),

                      ],
                    ),
                  )
                ],
              ),
            );
          }, separatorBuilder: (context, index) {
            return heightSpace(16);
          }, itemCount: 3)
        ],
      ),
    );
  }
}
