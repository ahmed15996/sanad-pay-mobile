
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';

import '../../../../../../core/constants/app_colors.dart';

class CustomIconAppBarWidget extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;

  final double? radius;

  const CustomIconAppBarWidget(
      {super.key, required this.child, this.onTap, this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.whiteColor,
      radius: radius ?? 22.r,
      child: child,
    ).onTapShadow(
      borderRadius: BorderRadius.circular(radius ?? 22.r),
      function: onTap ??
          () {
            context.pop();
          },
    );
  }
}
