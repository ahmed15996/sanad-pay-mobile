
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/framework/spaces.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/util/routing/routes.dart';
import '../../cubit/profile_cubit.dart';
import 'custom_setting_item_widget.dart';

class CustomSettingList extends StatefulWidget {
  final ProfileCubit cubit;
  final bool isUser;

  const CustomSettingList(
      {super.key, required this.cubit, required this.isUser});

  @override
  State<CustomSettingList> createState() => _CustomSettingListState();
}

class _CustomSettingListState extends State<CustomSettingList> {
  @override
  void initState() {
    // widget.cubit.checkAuthentication();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [

          // if (widget.cubit.isAuthenticated) ...[
          //   CustomSettingItemWidget(
          //     t,
          //     title: LocaleKeys.touchIdFaceId.tr(),
          //     widget: SizedBox(
          //       width: 24.w,
          //       height: 24.h,
          //       child: Transform.scale(
          //         scale: 0.55,
          //         child: Switch(
          //           activeColor: AppColors.primaryColor,
          //           inactiveThumbColor: AppColors.whiteColor,
          //           value: widget.cubit.isHasFaceId ?? false,
          //           onChanged: (value) {
          //             if (widget.cubit.token!.isNotEmpty) {
          //               widget.cubit.changeHasFaceId();
          //             } else {
          //               if (context.mounted) {
          //                 showDialog(
          //                   context: context,
          //                   builder: (_) => const CustomVisitorDialog(),
          //                 );
          //               }
          //             }
          //           },
          //         ),
          //       ),
          //     ),
          //   ),
          // ],
      CustomSettingItemWidget(
      title: "Cards",
      trailingIcon: AppAssets.arrowForward,
      onTap: () {
      },
    ),
          CustomSettingItemWidget(
                        title:
                "Language (${context.locale.languageCode == "en" ? "English" : "العربية"})",
            widget: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Theme.of(context).cardColor)),
              child: Text(
                context.locale.languageCode == "ar" ? "En" : "Ar",
                style: AppTextStyles.textStyle12,
              ),
            ),
            onTap: () {
              widget.cubit.saveChanges(context);
            },
          ),
          CustomSettingItemWidget(
                   title: "Faq",
            trailingIcon: AppAssets.arrowForward,
            onTap: () {
              context.pushWithNamed(
                Routes.faqView,
              );
            },
          ),
          CustomSettingItemWidget(
                     title: "terms and conditions",
            trailingIcon: AppAssets.arrowForward,
            onTap: () {
              context.pushWithNamed(Routes.termsView);
            },
          ),
          CustomSettingItemWidget(
                       title: "privacy policy",
            trailingIcon: AppAssets.arrowForward,
            onTap: () {
              // context.pushWithNamed(Routes.privacyView);
            },
          ),
          CustomSettingItemWidget(
                    title: "About",
            trailingIcon: AppAssets.arrowForward,
            onTap: () {
              // context.pushWithNamed(Routes.aboutSupercom);
            },
          ),
          CustomSettingItemWidget(
            title: "Contact Us",
            trailingIcon: AppAssets.arrowForward,
            onTap: () {
              context.pushWithNamed(Routes.contactUsView);
            },
          ),
          CustomSettingItemWidget(
                      title: "Rate Us",
            trailingIcon: AppAssets.arrowForward,
            onTap: () {
              // if (Platform.isAndroid) {
              //   widget.cubit
              //       .goLink(link: widget.cubit.socialMediaModel!.android);
              // } else {
              //   widget.cubit.goLink(link: widget.cubit.socialMediaModel!.ios);
              // }
            },
          ),
          heightSpace(16),
          Row(
            children: [
              SvgPicture.asset(AppAssets.trash),
              widthSpace(11.w),
              Expanded(
                child: Text(
                  "Delete Account",
                  style: AppTextStyles.textStyle14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.redColor,
                  ),
                ),
              ),
            ],
          ),
          heightSpace(8),
          Text("Your request will be reviewed before the account is deleted.",style: AppTextStyles.textStyle10.copyWith(
            color: AppColors.redColor
          ),)
        ],
      ),
    );
  }
}
