
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';

enum ToastStates { success, error, warning }

Color? toastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = AppColors.primaryColor;
      break;
    case ToastStates.error:
      color = AppColors.redColor;
      break;
    case ToastStates.warning:
      color = Colors.yellow;
      break;
  }
  return color;
}

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: toastColor(state),
      textColor: AppColors.blackColor,
      fontAsset: "assets/fonts/Manrope-Regular.ttf",
      fontSize: AppFonts.t15,
    );
