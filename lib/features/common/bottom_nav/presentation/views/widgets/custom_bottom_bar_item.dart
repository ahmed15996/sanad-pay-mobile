import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/framework/spaces.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../cubit/bottom_nav_cubit.dart';

class CustomBottomBarItem extends StatelessWidget {

  final String icon,title;
  final int index;

  const CustomBottomBarItem({
    super.key,
    required this.icon,
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BottomNavCubit>();
    return Column(
      children: [
        SvgPicture.asset(
          icon,
          color: cubit.currentIndex == index
              ? AppColors.secondaryColor
              : AppColors.lightGreyColor,
          height: 28.h,
          width: 28.w,
        ).onTap(
          function: () {
            // String token = cubit.appPref.getData(key: AppCached.token) ?? '';
              if (cubit.currentIndex != index) {
                cubit.changeNavIndex(index: index);
              }
          },
        ),
        heightSpace(4),
        Text(
          title,
          style: AppTextStyles.textStyle10.copyWith(
            color: AppColors.lightGreyColor,
          ),
        ),
      ],
    );
  }
}
