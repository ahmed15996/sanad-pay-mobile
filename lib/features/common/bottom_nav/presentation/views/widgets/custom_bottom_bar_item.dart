import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/framework/spaces.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import 'package:sanad/core/widgets/custom_vistor_dialog.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../cubit/bottom_nav_cubit.dart';

class CustomBottomBarItem extends StatelessWidget {

  final String icon,title;
  final int index;
  final bool isUser;

  const CustomBottomBarItem({
    super.key,
    required this.icon,
    required this.title,
    required this.index,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BottomNavCubit>();
    return Column(
      children: [
        SvgPicture.asset(
          icon,
          color: cubit.currentIndex == index
              ? AppColors.rhinoDark.shade500
              : AppColors.lightGreyColor,
          height: 28.h,
          width: 28.w,
        ),
        heightSpace(2),
        Text(
          title,
          style: AppTextStyles.textStyle10.copyWith(
            color: AppColors.lightGreyColor,
          ),
        ),
      ],
    ).onTap(function: () {
      if (cubit.token.isNotEmpty) {
        if (cubit.currentIndex != index) {
          cubit.changeNavIndex(index: index);
        }
      } else {
        if (isUser == true && index != 3) {
          if (cubit.currentIndex != index) {
            cubit.changeNavIndex(index: index);
          }
        } else {
          if (context.mounted) {
            showDialog(
              context: context,
              builder: (_) => const CustomVisitorDialog(),
            );
          }
        }
      }
    },);
  }
}
