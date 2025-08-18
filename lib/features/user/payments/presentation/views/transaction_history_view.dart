import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/core/constants/app_text_styles.dart';
import 'package:sanad/core/widgets/custom_image_network.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/widgets/custom_appbar.dart';

class TransactionHistoryView extends StatelessWidget {
  const TransactionHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: CustomAppbar(title: "Transaction History"),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Row(
            children: [
              CustomImageNetwork(image: AppAssets.testImage,widthImage: 32,heightImage: 32,radiusValue: 25,),
              widthSpace(12.w),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("store name",style: AppTextStyles.textStyle14.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkSecondaryColor
                  ),),
                  heightSpace(4),
                  Text("300,00 SAR",style: AppTextStyles.textStyle16.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondaryColor
                  ),),

              ],)),
              Text("January 27, 2027 02:00AM",style: AppTextStyles.textStyle10.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor
              ),),
            ],
          );
        },
        itemCount: 4,
        separatorBuilder: (context, index) {
          return heightSpace(16.h);
        },
      ));
  }
}
