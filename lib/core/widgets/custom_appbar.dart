import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool canPop, isSheet,centerTitle;
  final Widget? leading;
  final Color? titleColor;
  final double? leadingWidth;
  final List<Widget>? actions;
  final VoidCallback? cancelOnTap;
  const CustomAppbar({
    super.key,
    required this.title,
    this.canPop = true,
    this.isSheet = false,
    this.leading,
    this.actions,
    this.cancelOnTap,
    this.leadingWidth,
    this.titleColor,  this.centerTitle = true,

  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.textStyle20.copyWith(fontWeight: FontWeight.w600,color: titleColor ?? AppColors.darkSecondaryColor),
      ),
      centerTitle: centerTitle,
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      leadingWidth: leadingWidth,
      leading: leading == null && canPop
          ? SvgPicture.asset(
              AppAssets.arrowBack,
              fit: BoxFit.scaleDown,
            ).onTap(function: () => context.pop())
          : leading,
      actions: isSheet
          ? [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child:
                    SvgPicture.asset(
                      AppAssets.cancel,
                    ).onTap(
                      function: () {
                        cancelOnTap?.call();
                        context.pop();
                      },
                    ),
              ),
            ]
          : actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
