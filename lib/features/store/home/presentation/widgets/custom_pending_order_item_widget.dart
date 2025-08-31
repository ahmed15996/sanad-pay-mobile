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

class CustomPendingOrderItemWidget extends StatelessWidget {
  final OrderModel orderModel;
  const CustomPendingOrderItemWidget({super.key, required this.orderModel});

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
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(orderModel.userName ?? "",style: AppTextStyles.textStyle12.copyWith(
                    color: AppColors.blackColor
                ),),
                heightSpace(6),
                Row(
                  children: [
                    Text("(${LocaleKeys.billTotal.tr()})",style: AppTextStyles.textStyle10.copyWith(
                        color: AppColors.textColor
                    ),),
                    widthSpace(24.w),
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
          ),
          Column(
            children: [
              SvgPicture.asset(AppAssets.clock,width: 60.w,height: 60.h,color: AppColors.orangeColor,),
              heightSpace(5),
              Text(LocaleKeys.waitingClientApprove.tr(),style: AppTextStyles.textStyle10.copyWith(color: AppColors.blackColor),)
            ],
          )
        ],
      ),
    );
  }
}
