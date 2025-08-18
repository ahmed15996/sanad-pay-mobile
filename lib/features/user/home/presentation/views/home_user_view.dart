import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/core/constants/app_colors.dart';
import 'package:sanad/core/framework/spaces.dart';
import 'package:sanad/core/widgets/custom_image_network.dart';
import 'package:sanad/core/widgets/custom_text_form_field.dart';
import 'package:sanad/features/user/home/presentation/views/widgets/custom_slider_and_indicator_widget.dart';

import '../../../../../core/constants/app_text_styles.dart';

class HomeUserView extends StatelessWidget {
  const HomeUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(AppAssets.avatar),
            widthSpace(9),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ismail alomar",
                    style: AppTextStyles.textStyle16.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkSecondaryColor,
                    ),
                  ),
                  Text(
                    "Your Balance: 100 SAR",
                    style: AppTextStyles.textStyle12.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.darkSecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(AppAssets.notification),
          ],
        ),
        heightSpace(16),
        CustomTextFormField(
          fillColor: AppColors.whiteColor,
          prefixIcon: SvgPicture.asset(AppAssets.search),
          hintText: "search",
        ),
        heightSpace(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Account Incomplete",style: AppTextStyles.textStyle16.copyWith(color: AppColors.primaryColor,fontWeight: FontWeight.w500),),
            widthSpace(6),
            SvgPicture.asset(AppAssets.incompleteInfo),
          ],
        ),
        heightSpace(15),
        Container(
          padding: EdgeInsetsDirectional.only(start: 9.w,end:18.w,top: 5.5.h,bottom: 5.5.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              Expanded(child: Text("Please complete your information through Nafath verification to activate your account.",style: AppTextStyles.textStyle10.copyWith(
                fontWeight: FontWeight.w300,
                color: AppColors.darkSecondaryColor
              ),)),
              widthSpace(5),
              SvgPicture.asset(AppAssets.arrowForward),
            ],
          ),
        ),
        heightSpace(16),
        Text(
          "Selected Stores",
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
        heightSpace(16),
        Text(
          "Categories",
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
        CustomSliderAndIndicatorWidget(),
        heightSpace(24),
        Text(
          "Nearby Stores",
          style: AppTextStyles.textStyle16.copyWith(
            color: AppColors.darkSecondaryColor,
          ),
        ),
        heightSpace(12),
        GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 35.w,
          childAspectRatio: 146.w / 132.h,
          children: List.generate(
            6,
            (index) => Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CustomImageNetwork(image: AppAssets.testImage, radiusValue: 13),
                Container(
                  height: 32.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 7.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(13.r),
                    ),
                    color: Color(0xff212121).withOpacity(0.76),
                  ),
                  child: Text(
                    "Chaplin",
                    style: AppTextStyles.textStyle12.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
