import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/core/constants/app_text_styles.dart';
import 'package:sanad/core/widgets/custom_image_network.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/widgets/custom_appbar.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: CustomAppbar(title: "Notifications"),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return Row(
              children: [ 
                CustomImageNetwork(image: AppAssets.testImage,widthImage: 32,heightImage: 32,radiusValue: 25,),
                widthSpace(30.w),
                Expanded(
                  child: Text("Your payment is due tomorrow.Please make sure to pay on time",style: AppTextStyles.textStyle14.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor
                  ),),
                ),
              ],
            );
          },
          itemCount: 4,
          separatorBuilder: (context, index) {
            return heightSpace(32.h);
          },
        ));
  }
}
