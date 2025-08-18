
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/util/extensions/media_query.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import '../../generated/locale_keys.g.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../framework/spaces.dart';
import '../util/routing/routes.dart';
import 'custom_button.dart';

class CustomLoginExpiredDialog extends StatelessWidget {
  const CustomLoginExpiredDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Dialog(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
              vertical: 25.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AppAssets.unAuthenticated,
                  height: context.height * 0.08,
                ),
                heightSpace(20.h),
                Text(
                  LocaleKeys.unAuthenticated.tr(),
                  style: AppTextStyles.textStyle14
                      .copyWith(color: AppColors.whiteColor),
                  textAlign: TextAlign.center,
                ),
                heightSpace(25.h),
                CustomButton(
                  onPressed: () {
                    context.pushAndRemoveUntilWithNamed(
                      Routes.loginView,
                    );
                  },
                  text: LocaleKeys.signIn.tr(),
                ),
              ],
            ),
          ),
        ));
  }
}
