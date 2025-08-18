import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../generated/locale_keys.g.dart';
import 'dart:ui' as ui;

class CustomCodeSentSuccessWidget extends StatelessWidget {
  final String phone;

  const CustomCodeSentSuccessWidget({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      text:  "${LocaleKeys.sentVerificationCode.tr()}: $phone.  ",
      style: AppTextStyles.textStyle16.copyWith(color: AppColors.darkSecondaryColor),
      children: [
        TextSpan(
            text:
              "[${LocaleKeys.edit.tr()}]",
              style: AppTextStyles.textStyle16.copyWith(
                  color: AppColors.primaryColor
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pop();
                }
        )
      ]
    ));
  }
}
