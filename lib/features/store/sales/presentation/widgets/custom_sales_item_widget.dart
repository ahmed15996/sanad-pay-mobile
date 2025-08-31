import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/features/store/home/data/models/order_model.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_shadows.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';

class CustomSalesItemWidget extends StatelessWidget {
  final OrderModel orderModel;
  const CustomSalesItemWidget({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [AppShadows.defaultShadow],
      ),
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(orderModel.userName ?? "", style: AppTextStyles.textStyle12.copyWith(
                    color: AppColors.blackColor
                )),
                heightSpace(8),
                Row(

                  children: [
                    Text(
                      orderModel.total,
                      style: AppTextStyles.textStyle14.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor
                      ),
                    ),
                    widthSpace(2.w),
                    SvgPicture.asset(
                      AppAssets.sr,
                      color: AppColors.blackColor,
                    ),
                  ],
                ),
              ],
            ),
          ),

          Text(
            orderModel.date,
            style: AppTextStyles.textStyle10.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
