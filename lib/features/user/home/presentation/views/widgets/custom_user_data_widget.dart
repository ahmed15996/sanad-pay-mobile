import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import 'package:sanad/core/util/routing/routes.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import 'package:sanad/generated/locale_keys.g.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';

class CustomUserDataWidget extends StatelessWidget {
  final UserModel? userModel;
  const CustomUserDataWidget({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Row(
        children: [
          userModel != null
              ? CachedNetworkImage(
                  imageUrl: userModel!.image,
                  width: 33,
                  height: 33,
                )
              : SvgPicture.asset(AppAssets.avatar),
          widthSpace(9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userModel?.name ?? LocaleKeys.login.tr(),
                  style: AppTextStyles.textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.rhinoDark.shade600,
                  ),
                ).onTap(
                  function: () {
                    if(userModel == null){
                    context.pushWithNamed(Routes.loginView);
                    }
                  },
                ),
                if (userModel != null)
                  Text(
                    "${LocaleKeys.yourBalance.tr()}: ${userModel!.balance} ${LocaleKeys.sar.tr()}",
                    style: AppTextStyles.textStyle12.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.rhinoDark.shade600,
                    ),
                  ),
              ],
            ),
          ),
          if(userModel != null)
          SvgPicture.asset(AppAssets.notification).onTap(
            function: () {
              context.pushWithNamed(Routes.notificationsView);
            },
          ),
        ],
      ),
    );
  }
}
