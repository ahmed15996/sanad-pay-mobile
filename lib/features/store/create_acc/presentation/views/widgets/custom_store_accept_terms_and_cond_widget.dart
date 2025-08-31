import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sanad/core/util/extensions/navigation.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart' show AppTextStyles;
import '../../../../../../core/util/routing/routes.dart';
import '../../../../../../generated/locale_keys.g.dart';

class CustomStoreAcceptTermsAndCondWidget extends StatelessWidget {
  const CustomStoreAcceptTermsAndCondWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "${LocaleKeys.byCreatingAnAccountYouAgreeToThe.tr()}\t",
            style: AppTextStyles.textStyle12.copyWith(
              color: AppColors.textColor,
            ),
          ),
          TextSpan(
            text: LocaleKeys.termsAndConditions.tr(),
            style: AppTextStyles.textStyle14.copyWith(
                decorationColor: AppColors.primaryColor,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushWithNamed(Routes.termsView);
              },
          ),
          TextSpan(
            text: "\t${LocaleKeys.app.tr()}",
            style: AppTextStyles.textStyle12.copyWith(
              color: AppColors.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
