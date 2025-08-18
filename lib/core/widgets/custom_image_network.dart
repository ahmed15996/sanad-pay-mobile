
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../generated/locale_keys.g.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../framework/spaces.dart';

class CustomImageNetwork extends StatelessWidget {
  final double? heightImage,
      widthImage,
      heightLoading,
      widthLoading,
      heightImageError,
      widthImageError,
      strokeWidth,
      widthBigImageLoading,
      radiusValue;

  final BoxFit? fit;

  final String image;
  final TextStyle? textStyleProblemImage, textStyleLoading;
  final bool? isShowText, isBigLoading;


  const CustomImageNetwork(
      {super.key,
      this.heightImage,
      this.widthImage,
      this.fit,
      required this.image,
      this.textStyleProblemImage,
      this.heightImageError,
      this.widthImageError,
      this.isShowText = false,
      this.isBigLoading = false,
      this.heightLoading,
      this.widthLoading,
      this.strokeWidth,
      this.textStyleLoading,
      this.widthBigImageLoading, this.radiusValue});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radiusValue?.r ?? 0),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: fit ?? BoxFit.cover,
        height: heightImage?.h,
        width: widthImage?.w,
        placeholder: (context, url) => isBigLoading == false
            ? Center(
                child: Image.asset(
                  AppAssets.loading,
                  width: 50.w,
                  height: 50.h,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.loading,
                    width: 70.w,
                    height: 70.h,
                  ),
                  heightSpace(10.h),
                  Text(
                    LocaleKeys.loading.tr(),
                    style: textStyleLoading ??
                        AppTextStyles.textStyle16.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
        errorWidget: (context, url, error) =>SvgPicture.asset(
          AppAssets.noImage,
          height: heightImageError,
          width: widthImageError,
        ),
      ),
    );
  }
}
