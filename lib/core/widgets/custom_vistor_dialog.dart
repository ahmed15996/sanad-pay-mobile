
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/util/extensions/media_query.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import '../../generated/locale_keys.g.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../framework/spaces.dart';
import '../util/routing/routes.dart';
import 'custom_button.dart';

class CustomVisitorDialog extends StatelessWidget {
  const CustomVisitorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(

      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(     
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: SvgPicture.asset(AppAssets.cancel).onTap(function: () {
                context.pop();
              },),

            ),
            Container(
              height: 44.h,
              width: 44.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondaryColor,
                border: Border.all(color: AppColors.whiteColor.withOpacity(0.5)),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppAssets.incompleteInfo,
                  height: 28.h,
                  width: 28.w,
                ),
              ),
            ),
            heightSpace(20),
            Text(
              LocaleKeys.signInRequest.tr(),
              style: AppTextStyles.textStyle16.copyWith(
                fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
            ),
            heightSpace(25),
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
    );
  }
}
