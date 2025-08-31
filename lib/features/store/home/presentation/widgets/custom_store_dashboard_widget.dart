import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/helpers/url_launcher_helper.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import 'package:sanad/core/widgets/custom_image_network.dart';
import 'package:sanad/features/common/auth/data/models/user_model.dart';
import 'package:sanad/features/store/home/data/models/dashboard_model.dart';
import 'package:sanad/features/store/home/presentation/cubit/home_store_cubit.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/util/routing/routes.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../common/profile/data/models/app_settings_model.dart';

class CustomStoreDashboardWidget extends StatelessWidget {
  final DashboardModel dashboardModel;
  final UserModel userModel;
  final AppSettingsModel appSettingsModel;
  const CustomStoreDashboardWidget({
    super.key,
    required this.dashboardModel,
    required this.userModel,
    required this.appSettingsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 38.w, end: 25.w, top: 30.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(AppAssets.settings).onTap(
                function: () async{
                  await context.pushWithNamed(Routes.profileView);
                },
              ),
              Container(
                decoration: ShapeDecoration(
                  shape: PolygonBorder(
                    sides: 6,
                    side: BorderSide(color: AppColors.whiteColor),
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Container(
                  width: 124.w,
                  height: 124.h,
                  decoration: ShapeDecoration(
                    color: AppColors.whiteColor,
                    shape: PolygonBorder(
                      sides: 6,
                      side: BorderSide(color: AppColors.whiteColor),
                    ),
                  ),
                  padding: EdgeInsets.all(20.w),
                  child: CustomImageNetwork(image: userModel.image),
                ),
              ),
              SvgPicture.asset(AppAssets.contact).onTap(
                function: () {
                  UrlLauncherHelper.launchWhatsappLink(appSettingsModel.phone);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    LocaleKeys.todayTotalSales.tr(),
                    style: AppTextStyles.textStyle12,
                  ),
                  heightSpace(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${dashboardModel.todaySales}",
                        style: AppTextStyles.textStyle14.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      widthSpace(2),
                      SvgPicture.asset(AppAssets.sr),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    LocaleKeys.currentMonthTotalSales.tr(),
                    style: AppTextStyles.textStyle12,
                  ),
                  heightSpace(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${dashboardModel.monthSales}",
                        style: AppTextStyles.textStyle14.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      widthSpace(2),
                      SvgPicture.asset(AppAssets.sr),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
