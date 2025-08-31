import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import 'package:sanad/features/user/home/data/models/banner_model.dart';

import '../../../../../../core/helpers/url_launcher_helper.dart';
import '../../../../../../core/widgets/custom_image_network.dart';

class CustomSliderItemWidget extends StatelessWidget {
  final BannerModel bannerModel;
  const CustomSliderItemWidget({super.key, required this.bannerModel});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: CustomImageNetwork(
        image: bannerModel.image,
        radiusValue: 12,
      ),
    ).onTap(function: () {
      UrlLauncherHelper.openLink(bannerModel.link);
    },);
  }
}
