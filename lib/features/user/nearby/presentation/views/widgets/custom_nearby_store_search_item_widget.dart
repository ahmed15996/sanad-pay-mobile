import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import 'package:sanad/features/user/home/data/models/store_model.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/helpers/url_launcher_helper.dart';
import '../../../../../../core/widgets/custom_image_network.dart';
import '../../../../../../generated/locale_keys.g.dart';

class CustomNearbyStoreSearchItemWidget extends StatelessWidget {
  final StoreModel storeModel;
  const CustomNearbyStoreSearchItemWidget({super.key, required this.storeModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.whiteColor,
      ),
      child: Row(
        children: [
          CustomImageNetwork(
            image: storeModel.logo,
            radiusValue: 12,
            widthImage: 62.w,
            heightImage: 63.h,
          ),
          widthSpace(16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  storeModel.name,
                  style: AppTextStyles.textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryColor,
                  ),
                ),

                Row(
                  children: [
                    SvgPicture.asset(AppAssets.location),
                    widthSpace(4.w),
                    Text(
                      "2.3 ${LocaleKeys.km.tr()} ${LocaleKeys.away.tr()}",
                      style: AppTextStyles.textStyle14.copyWith(
                        color: AppColors.rhinoDark.shade300,
                      ),
                    ),
                  ],
                ),
                heightSpace(4),
                Text(
                  storeModel.address,
                  style: AppTextStyles.textStyle12.copyWith(
                    color: AppColors.rhinoDark.shade300
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).onTap(function: () {
      UrlLauncherHelper.openGoogleMap(storeModel.lat, storeModel.long);
    },);
  }
}
