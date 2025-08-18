
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/util/routing/routes.dart';
import '../../cubit/profile_cubit.dart';
import 'custom_setting_item_widget.dart';

class CustomUserDataWidget extends StatelessWidget {
  final UserModel userModel;
  final bool isUser;

  const CustomUserDataWidget(
      {super.key, required this.userModel, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "User ID",
                      style: AppTextStyles.textStyle14),
                    heightSpace(3.h),
                    Text(
                        "1234567890",
                        style: AppTextStyles.textStyle14.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkSecondaryColor
                        )),
                  ],
                ),
              ),
              SvgPicture.asset(AppAssets.copy)

            ],
          ),
          heightSpace(16),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                        "Account Number",
                        style: AppTextStyles.textStyle14),
                    heightSpace(3.h),
                    Text(
                        "1234567890",
                        style: AppTextStyles.textStyle14.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkSecondaryColor
                        )),
                  ],
                ),
              ),
              SvgPicture.asset(AppAssets.copy)

            ],
          )

        ],
      ),
    );
  }
}
