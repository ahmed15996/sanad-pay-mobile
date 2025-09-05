
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../cubit/profile_cubit.dart';
import 'custom_dialog_buttons_widget.dart';

class CustomLogoutDialog extends StatelessWidget {
  const CustomLogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Spacer(),
                Text(
                  LocaleKeys.logout.tr(),
                  style: AppTextStyles.textStyle16.copyWith(
                    fontWeight: FontWeight.w700,
                      color: AppColors.blackColor
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  AppAssets.cancel,
                  height: 24.h,
                  width: 24.w,
                ).onTap(
                  function: () {
                    context.pop();
                  },
                ),
              ],
            ),
            heightSpace(48.h),
            Text(
              LocaleKeys.areSureLogOut.tr(),
              style: AppTextStyles.textStyle16.copyWith(
                fontWeight: FontWeight.w400,
                  color: AppColors.blackColor
              ),
            ),
            heightSpace(20.h),
            Text(
              LocaleKeys.sureLogout.tr(),
              style: AppTextStyles.textStyle12.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor

              ),
            ),
            heightSpace(48.h),
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                final cubit = BlocProvider.of<ProfileCubit>(context);
                return CustomDialogButtonsWidget(
                  state: state,
                  confirmText: LocaleKeys.logout.tr(),
                  confirmTap: () {
                    cubit.logOut(context: context);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
