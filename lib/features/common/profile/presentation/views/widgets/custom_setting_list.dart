import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/framework/spaces.dart';
import 'package:sanad/core/helpers/url_launcher_helper.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import 'package:sanad/features/common/profile/presentation/views/widgets/custom_delete_acc_dialog.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/util/routing/routes.dart';
import '../../../../../../core/widgets/custom_vistor_dialog.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../cubit/profile_cubit.dart';
import 'custom_setting_item_widget.dart';

class CustomSettingList extends StatefulWidget {
  final ProfileCubit cubit;
  final bool isUser;

  const CustomSettingList({
    super.key,
    required this.cubit,
    required this.isUser,
  });

  @override
  State<CustomSettingList> createState() => _CustomSettingListState();
}

class _CustomSettingListState extends State<CustomSettingList> {
  @override
  void initState() {
    widget.cubit.checkAuthentication();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSettingItemWidget(
            leadingIcon: AppAssets.language,
            title:
                "${LocaleKeys.language.tr()} (${context.locale.languageCode == "en" ? "English" : "العربية"})",
            widget: Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 7.h),
              decoration: BoxDecoration(
                color: AppColors.languageColor,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.borderSecondaryColor),
              ),
              child: Text(
                context.locale.languageCode == "ar" ? "En" : "Ar",
                style: AppTextStyles.textStyle12.copyWith(
                  color: AppColors.rhinoDark.shade600,
                ),
              ),
            ),
            onTap: () {
              widget.cubit.saveChanges(context);
            },
          ),
          if (widget.cubit.isAuthenticated) ...[
            CustomSettingItemWidget(
              title: LocaleKeys.touchIdFaceId.tr(),
              leadingIcon: AppAssets.face,
              widget: SizedBox(
                width: 24.w,
                height: 24.h,
                child: Transform.scale(
                  scale: 0.55,
                  child: Switch(
                    activeColor: AppColors.primaryColor,
                    inactiveThumbColor: AppColors.darkSecondaryColor,
                    value: widget.cubit.isHasFaceId ?? false,
                    onChanged: (value) {
                      if (widget.cubit.token.isNotEmpty) {
                        widget.cubit.changeHasFaceId();
                      } else {
                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder: (_) => const CustomVisitorDialog(),
                          );
                        }
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
          if (widget.isUser)
            CustomSettingItemWidget(
              leadingIcon: AppAssets.cards,
              title: LocaleKeys.cards.tr(),
              trailingIcon: AppAssets.iosArrow,
              onTap: () {},
            ),

          CustomSettingItemWidget(
            leadingIcon: AppAssets.faq,
            title: LocaleKeys.faq.tr(),
            trailingIcon: AppAssets.iosArrow,
            onTap: () {
              context.pushWithNamed(Routes.faqView);
            },
          ),
          CustomSettingItemWidget(
            leadingIcon: AppAssets.contract,
            title: LocaleKeys.termsAndConditions.tr(),
            trailingIcon: AppAssets.iosArrow,
            onTap: () {
              context.pushWithNamed(Routes.termsView);
            },
          ),
          CustomSettingItemWidget(
            leadingIcon: AppAssets.privacy,
            title: LocaleKeys.privacyAndPolicy.tr(),
            trailingIcon: AppAssets.iosArrow,
            onTap: () {
              context.pushWithNamed(Routes.privacyView);
            },
          ),
          CustomSettingItemWidget(
            leadingIcon: AppAssets.about,
            title: LocaleKeys.about.tr(),
            trailingIcon: AppAssets.iosArrow,
            onTap: () {
              context.pushWithNamed(Routes.aboutUsView);
            },
          ),
          CustomSettingItemWidget(
            leadingIcon: AppAssets.support,
            title: LocaleKeys.contactUs.tr(),
            trailingIcon: AppAssets.iosArrow,
            onTap: () {
              UrlLauncherHelper.launchWhatsappLink(
                widget.cubit.appSettingsModel!.phone,
              );
            },
          ),
          CustomSettingItemWidget(
            leadingIcon: AppAssets.rate,
            title: LocaleKeys.rateUs.tr(),
            trailingIcon: AppAssets.iosArrow,
            onTap: () {
              UrlLauncherHelper.openLink(
                Platform.isAndroid
                    ? widget.cubit.appSettingsModel!.androidUrl
                    : widget.cubit.appSettingsModel!.iosUrl,
              );
            },
          ),
          if (widget.cubit.token.isNotEmpty) ...[
            heightSpace(16),
            Row(
              children: [
                SvgPicture.asset(AppAssets.trash),
                widthSpace(11.w),
                Expanded(
                  child: Text(
                    LocaleKeys.deleteAcc.tr(),
                    style: AppTextStyles.textStyle14.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.redColor,
                    ),
                  ),
                ),
              ],
            ).onTap(
              function: () {
                showDialog(
                  context: context,
                  builder: (_) => BlocProvider.value(
                    value: context.read<ProfileCubit>(),
                    child: const CustomDeleteAccDialog(),
                  ),
                );
              },
            ),
            heightSpace(8),
            Text(
              LocaleKeys.deleteAccDesc.tr(),
              style: AppTextStyles.textStyle10.copyWith(
                color: AppColors.redColor,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
