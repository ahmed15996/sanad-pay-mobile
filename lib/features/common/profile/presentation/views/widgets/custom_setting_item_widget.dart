
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';

import '../../../../../../core/constants/app_text_styles.dart';

class CustomSettingItemWidget extends StatelessWidget {
  final String title;
  final double? iconSize;
  final String? trailingIcon;
  final Color? color,leadIconColor;
  final Widget? widget;

  final void Function()? onTap;

  const CustomSettingItemWidget(
      {super.key,
      required this.title,
       this.leadIconColor,
      this.trailingIcon,
      this.onTap,
      this.iconSize,
      this.color,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.textStyle14.copyWith(
                fontWeight: FontWeight.w500,
                color: color
              ),
            ),
          ),
          if (widget != null) ...[
            widget!,
          ],
          if (trailingIcon != null) ...[
            SvgPicture.asset(
              trailingIcon!,
              height: 24.h,
              width: 24.w,
              matchTextDirection: true,
            ),
          ],
        ],
      ).onTapShadow(
        borderRadius: BorderRadius.zero,
        function: onTap ?? (){},
      ),
    );
  }
}
