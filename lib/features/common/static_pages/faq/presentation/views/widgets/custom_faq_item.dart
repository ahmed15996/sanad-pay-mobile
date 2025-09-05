import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_text_styles.dart';

class CustomFaqItem extends StatefulWidget {
  final String ask, answer;
  final bool isLast;

  const CustomFaqItem({
    super.key,
    required this.ask,
    required this.answer,
    required this.isLast,
  });

  @override
  State<CustomFaqItem> createState() => _CustomFaqItemState();
}

class _CustomFaqItemState extends State<CustomFaqItem> {
  bool isExpand = false;

  changeExpandableWidget({required bool value}) {
    isExpand = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      minTileHeight: 45.h,
      backgroundColor: AppColors.transparentColor,
      trailing: Padding(
        padding: EdgeInsetsDirectional.only(end: 15.w),
        child: SvgPicture.asset(
          isExpand == false ? AppAssets.arrowDown : AppAssets.arrowUp,
          height: 20.h,
          width: 20.w,
        ),
      ),
      onExpansionChanged: (value) {
        changeExpandableWidget(value: value);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      title: Padding(
        padding: EdgeInsetsDirectional.only(start: 15.w),
        child: Text(
          widget.ask,
          style: AppTextStyles.textStyle14.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
          ),
        ),
      ),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
          child: Column(
            children: [
              HtmlWidget(
                widget.answer,
                textStyle: AppTextStyles.textStyle12.copyWith(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              widget.isLast == false
                  ? Padding(
                      padding: EdgeInsetsDirectional.only(top: 20.h),
                      child: const Divider(
                        color: AppColors.lighterGreyColor,
                        thickness: 2,
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
}
