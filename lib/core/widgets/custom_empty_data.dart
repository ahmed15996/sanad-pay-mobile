import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/util/extensions/media_query.dart';
import '../../generated/locale_keys.g.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../framework/spaces.dart';

class CustomEmptyData extends StatelessWidget {
  final String? image, text,subtitle;


  const CustomEmptyData({super.key, this.image, this.text,this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          if(image != null)
          SvgPicture.asset(
            image!,
            height: context.height * 0.24,
          ),
          heightSpace(20.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              text ?? LocaleKeys.emptyData.tr(),
              style: AppTextStyles.textStyle20.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.rhinoDark.shade600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          if(subtitle != null)
            ...[
              heightSpace(8.h),
              Text(
                subtitle!,
                style: AppTextStyles.textStyle14.copyWith(
                  color: AppColors.blackColor
                ),
                textAlign: TextAlign.center,
              ),
            ]
        ],
      ),
    );
  }
}
