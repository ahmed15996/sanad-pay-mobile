import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/core/constants/app_colors.dart';
import 'package:sanad/core/framework/spaces.dart';
import 'package:sanad/core/widgets/custom_appbar.dart';
import 'package:sanad/core/widgets/custom_image_network.dart';
import 'package:sanad/core/widgets/custom_text_form_field.dart';
import 'package:sanad/features/user/home/presentation/views/widgets/custom_slider_and_indicator_widget.dart';

import '../../../../../core/constants/app_text_styles.dart';

class HomeUserView extends StatelessWidget {
  const HomeUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Nearby Stores"),
      body: Column(
        children: [
          heightSpace(16),
          CustomTextFormField(
            fillColor: AppColors.whiteColor,
            prefixIcon: SvgPicture.asset(AppAssets.search),
            hintText: "Search by store name...",
          ),
          heightSpace(24),
          Text(
            "Most Popular Nearby Stores",
            style: AppTextStyles.textStyle16.copyWith(
              color: AppColors.darkSecondaryColor,
            ),
          ),
          heightSpace(12),
          SizedBox(
            height: 70.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CustomImageNetwork(
                      image: AppAssets.testImage,
                      widthImage: 50,
                      heightImage: 50,
                      radiusValue: 25,
                    ),
                    heightSpace(4),
                    Text("Store Name", style: AppTextStyles.textStyle12),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return widthSpace(16);
              },
              itemCount: 6,
            ),
          ),
          heightSpace(24),
          Text(
            "Nearby Stores",
            style: AppTextStyles.textStyle16.copyWith(
              color: AppColors.darkSecondaryColor,
            ),
          ),
          heightSpace(12),
          ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.whiteColor,
                ),
                child: Row(
                  children: [
                    CustomImageNetwork(image: AppAssets.testImage,radiusValue: 12,widthImage: 62.w,heightImage: 63.h,),
                    widthSpace(16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("store name",style: AppTextStyles.textStyle16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondaryColor
                          ),),
                          
                          Row(
                            children: [
                              SvgPicture.asset(AppAssets.location),
                              widthSpace(4.w),
                              Text("2.3 km away",style: AppTextStyles.textStyle12.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textColor
                              ),),

                            ],
                          ),
                          heightSpace(4),
                          Text("Prince Sultan Rd, Al Zahra,Riyadh, Saudi Arabia",style: AppTextStyles.textStyle12,)


                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
return heightSpace(16);
            },
            itemCount: 4,
          ),
        ],
      ),
    );
  }
}
