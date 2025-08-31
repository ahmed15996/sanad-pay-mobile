import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../cubit/profile_cubit.dart';

class CustomDialogButtonsWidget extends StatelessWidget {
  final String confirmText;

  final void Function() confirmTap;

  final ProfileState state;

  const CustomDialogButtonsWidget(
      {super.key,
      required this.confirmText,
      required this.state,
      required this.confirmTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            height: 40.h,
            onPressed: confirmTap,
            text: confirmText,
            backgroundColor: AppColors.primaryColor,
            isLoading: state is LogOutLoading || state is DeleteAccLoading,
          ),
        ),
        widthSpace(28.w),
        Expanded(
          child: CustomButton(
            height: 40.h,
            backgroundColor: AppColors.blackColor,
            onPressed: () {
              context.pop();
            },
            text: LocaleKeys.cancel.tr(),
          ),
        )
      ],
    );
  }
}
