import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool canPop, isSheet, centerTitle;
  final Color? titleColor;
  final Widget? leading;
  final double? leadingWidth;
  final List<Widget>? actions;
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  const CustomAppbar({
    super.key,
    required this.title,
    this.canPop = true,
    this.isSheet = false,
    this.actions,
    this.titleColor,
    this.leading,
    this.leadingWidth,
    this.systemUiOverlayStyle,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.textStyle20.copyWith(
          fontWeight: FontWeight.w600,
          color: titleColor ?? AppColors.darkSecondaryColor,
        ),
      ),
      centerTitle: centerTitle,
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      leadingWidth: leadingWidth,
      systemOverlayStyle: systemUiOverlayStyle,
      leading: canPop
          ? leading ?? Transform(
              alignment: Alignment.center,
              transform:
                  TextDirection.ltr.name == Directionality.of(context).name
                  ? Matrix4.rotationY(3.1416)
                  : Matrix4.rotationY(0),
              child: SvgPicture.asset(
                AppAssets.arrowBack,

                fit: BoxFit.scaleDown,
                color: AppColors.blackColor,
              ).onTap(function: () => context.pop()),
            )
          : null,
      actions: isSheet
          ? [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SvgPicture.asset(AppAssets.cancel).onTap(
                  function: () {
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
