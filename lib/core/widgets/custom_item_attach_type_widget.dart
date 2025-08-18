import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import '../constants/app_text_styles.dart';
import '../framework/spaces.dart';

class CustomItemAttachTypeWidget extends StatelessWidget {
  final String image, name;
  final void Function() onTap;

  const CustomItemAttachTypeWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 25.w, vertical: 10.h),
      child: Row(
        children: [
          SvgPicture.asset(
            image,
            height: 30.h,
            width: 30.w,
          ),
          widthSpace(10.w),
          Expanded(
            child: Text(
              name,
              style: AppTextStyles.textStyle14.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ).onTapShadow(
        borderRadius: BorderRadius.zero,
        function: onTap,
      ),
    );
  }
}
