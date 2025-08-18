
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/util/extensions/media_query.dart';
import '../../generated/locale_keys.g.dart';
import '../constants/app_assets.dart';
import '../constants/app_text_styles.dart';
import '../framework/spaces.dart';
import 'custom_button.dart';

class CustomError extends StatelessWidget {
  final String error;
  final void Function() retry;
  final bool? isLogo;

  const CustomError(
      {super.key,
      required this.error,
      required this.retry,
      this.isLogo = true});

  @override
  Widget build(BuildContext context) {
    return isLogo == true
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                       AppAssets.noInternet,
                      width: error == LocaleKeys.noInternetError.tr()
                          ? context.width / 2.5
                          : context.width / 1.4,
                    ),
                    heightSpace(10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Text(
                        error,
                        style: AppTextStyles.textStyle14.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    heightSpace(20.h),
                    CustomButton(
                      onPressed: retry,
                      horizontalMargin: 16,
                      text: LocaleKeys.retry.tr(),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.noInternet,
                width: error == LocaleKeys.noInternetError.tr()
                    ? context.width / 2.5
                    : context.width / 1.4,
              ),
              heightSpace(10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  error,
                  style: AppTextStyles.textStyle14.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              heightSpace(20.h),
              CustomButton(
                onPressed: retry,
                text: LocaleKeys.retry.tr(),
              ),
            ],
          );
  }
}
