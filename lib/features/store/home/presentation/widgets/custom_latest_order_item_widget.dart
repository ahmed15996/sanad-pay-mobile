import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/features/store/home/data/models/order_model.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_shadows.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../generated/locale_keys.g.dart';

class CustomLatestOrderItemWidget extends StatelessWidget {
  final OrderModel orderModel;
  const CustomLatestOrderItemWidget({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [AppShadows.defaultShadow],
      ),
      padding: EdgeInsets.all(20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.name.tr(),style: AppTextStyles.textStyle10.copyWith(
                  color: AppColors.textColor
              ),),
              heightSpace(9),
              Text(orderModel.userName ?? "",style: AppTextStyles.textStyle12.copyWith(
                  color: AppColors.blackColor
              ),),

            ],
          ),
          Column(
            children: [
              Text("(${LocaleKeys.billTotal.tr()})",style: AppTextStyles.textStyle10.copyWith(
                  color: AppColors.textColor
              ),),
              heightSpace(9),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(orderModel.total,style: AppTextStyles.textStyle14.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor
                  ),),
                  widthSpace(2.w),
                  SvgPicture.asset(AppAssets.sr,color: AppColors.blackColor,)
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.dateAndTime.tr(),style: AppTextStyles.textStyle10.copyWith(
                  color: AppColors.textColor
              ),),
              heightSpace(9),
              Text(orderModel.date,style: AppTextStyles.textStyle10.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor
              ),),

            ],
          ),
        ],
      ),
    );
  }
}
