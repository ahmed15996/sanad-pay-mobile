import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../generated/locale_keys.g.dart';

class CustomIncompleteNationalIdVerificationWidget extends StatelessWidget {
  const CustomIncompleteNationalIdVerificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.accountIncomplete.tr(),
              style: AppTextStyles.textStyle16.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            widthSpace(6),
            SvgPicture.asset(AppAssets.incompleteInfo),
          ],
        ),
        heightSpace(15),
        Container(
          padding: EdgeInsetsDirectional.only(
            start: 9.w,
            end: 18.w,
            top: 5.5.h,
            bottom: 5.5.h,
          ),
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: LocaleKeys.pleaseCompleteYourInformationThrough.tr(),
                    style: AppTextStyles.textStyle10.copyWith(
                      fontWeight: FontWeight.w300,
                      color: AppColors.rhinoDark.shade400,
                    ),
                    children: [
                      TextSpan(
                        text: " ${LocaleKeys.nafathVerification.tr()} ",
                        style: AppTextStyles.textStyle10.copyWith(
                          fontWeight: FontWeight.w300,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      TextSpan(
                        text: LocaleKeys.toActivateYourAccount.tr(),
                        style: AppTextStyles.textStyle10.copyWith(
                          fontWeight: FontWeight.w300,
                          color: AppColors.rhinoDark.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              widthSpace(5),
              Transform(
                alignment: Alignment.center,
                transform:
                    TextDirection.ltr.name != Directionality.of(context).name
                    ? Matrix4.rotationY(3.1416)
                    : Matrix4.rotationY(0),
                child: SvgPicture.asset(AppAssets.arrowForward),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
