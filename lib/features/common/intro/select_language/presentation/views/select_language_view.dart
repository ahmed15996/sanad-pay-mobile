import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/generated/locale_keys.g.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../cubit/select_language_cubit.dart';

class SelectLanguageView extends StatelessWidget {
  const SelectLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 24.w, top: 20.h),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    LocaleKeys.selectLanguage.tr(),
                    style: AppTextStyles.textStyle32,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 64.w),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Please select language',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textStyle16.copyWith(
                      color: AppColors.rhinoDark.shade400,
                    ),
                  ),
                  Text(
                    'من فضلك حدد لغة التطبيق',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textStyle16.copyWith(
                      color: AppColors.rhinoDark.shade400,
                    ),
                  ),

                  heightSpace(75),
                  CustomButton(
                    onPressed: () {
                      context.read<SelectLanguageCubit>().saveChanges(
                        context,
                        0,
                      );
                    },
                    text: "العربية",
                  ),
                  heightSpace(22),
                  CustomButton(
                    onPressed: () {
                      context.read<SelectLanguageCubit>().saveChanges(
                        context,
                        1,
                      );
                    },
                    text: "English",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
