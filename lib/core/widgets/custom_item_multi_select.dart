import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../framework/spaces.dart';

class CustomItemMultiSelect extends StatelessWidget {
  final void Function() onItemSelect;
  final String name;
  final bool isSelected;
  const CustomItemMultiSelect({
    super.key,
    required this.onItemSelect,
    required this.name,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: AppTextStyles.textStyle10.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        widthSpace(10.w),
        SizedBox(
          width: 18.w,
          height: 18.h,
          child: Transform.scale(
            scale: 0.0022.sw,
            child: Checkbox(
              value: isSelected,
              side: BorderSide(width: 0.50.w, color: AppColors.hintColor),
              onChanged: (val) {
                onItemSelect();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
              activeColor: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    ).onTapShadow(borderRadius: BorderRadius.zero, function: onItemSelect);
  }
}
