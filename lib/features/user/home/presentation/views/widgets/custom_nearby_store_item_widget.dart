import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/constants/app_colors.dart';
import 'package:sanad/core/helpers/url_launcher_helper.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import 'package:sanad/features/user/home/data/models/store_model.dart';

import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/widgets/custom_image_network.dart';

class CustomNearbyStoreItemWidget extends StatelessWidget {
  final StoreModel storeModel;
  const CustomNearbyStoreItemWidget({super.key, required this.storeModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomImageNetwork(image: storeModel.logo, radiusValue: 13,widthImage: double.infinity,heightImage: double.infinity,),
        Container(
          height: 32.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(13.r)),
            color: AppColors.blackOpacityColor.withOpacity(0.76),
          ),
          child: Text(
            storeModel.name,
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ).onTap(
      function: () {
        UrlLauncherHelper.openGoogleMap(storeModel.lat, storeModel.long);
      },
    );
  }
}
