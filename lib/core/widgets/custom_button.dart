import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../framework/spaces.dart';
import 'custom_loading.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final void Function()? onPressed;
  final double? height, width, strokeWidth, radius, horizontalMargin;
  final Color? backgroundColor;
  final Border? border;
  final String? text;
  final TextStyle? style;
  final bool isLoading;

  const CustomButton({
    super.key,
    this.child,
    this.text,
    this.style,
    this.onPressed,
    this.height,
    this.width,
    this.backgroundColor,
    this.isLoading = false,
    this.border,
    this.radius,
    this.horizontalMargin,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: (height ?? 56).h,
        width: width ?? double.infinity,
        margin: EdgeInsets.symmetric(horizontal: (horizontalMargin ?? 0).w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular((radius ?? 30).r),
          border: border,
          color: backgroundColor ?? AppColors.primaryColor,
        ),
        child: isLoading == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: child ??
                        Text(
                          text ?? "",
                          style: style ??
                              AppTextStyles.textStyle16.copyWith(
                                fontWeight: FontWeight.w600,
                              ), 
                        ),
                  ),
                  widthSpace(7.w),
                  CustomLoading(
                    isButton: true,
                    loadingColor: AppColors.blackColor,
                    strokeWidth: strokeWidth ?? 3.5.w,
                  ),
                ],
              )
            : Center(
                child: (child ??
                    Text(
                      text ?? "",
                      textAlign: TextAlign.center,
                      style: style ??
                          AppTextStyles.textStyle16.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    )),
              ),
      ),
    );
  }
}
