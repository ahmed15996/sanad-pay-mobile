import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/util/routing/routes.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../cubit/profile_cubit.dart';
import 'custom_setting_item_widget.dart';

class CustomUserDataWidget extends StatelessWidget {
  final UserModel userModel;
  final bool isUser;

  const CustomUserDataWidget({
    super.key,
    required this.userModel,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.whiteColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.userId.tr(),
                  style: AppTextStyles.textStyle14.copyWith(
                    color: AppColors.rhinoDark.shade400,
                  ),
                ),
                heightSpace(3.h),
                Text(
                  userModel.id.toString(),
                  style: AppTextStyles.textStyle14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.rhinoDark.shade500,
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(AppAssets.copy).onTap(
            function: () {
              Clipboard.setData(ClipboardData(text: "${userModel.id}"));
            },
          ),
        ],
      ),
    );
  }
}
