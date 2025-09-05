import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_shadows.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/app_validator.dart';
import '../../cubits/pin_code_cubit/pin_code_cubit.dart';

class CustomPinCodeWidget extends StatelessWidget {
  const CustomPinCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PinCodeCubit>();
    return Form(
      key: cubit.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: Pinput(
            controller: cubit.pinCtrl,

            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            defaultPinTheme: buildPinTheme(),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            errorTextStyle: AppTextStyles.textStyle14.copyWith(
              color: AppColors.redColor,
            ),
            errorPinTheme: buildPinTheme(),
            validator: AppValidator.otpValidator,
            submittedPinTheme: buildPinTheme(),
            disabledPinTheme: buildPinTheme(),
            focusedPinTheme: buildPinTheme(),
            length: 4,
            showCursor: true,
          ),
        ),
      ),
    );
  }

  PinTheme buildPinTheme() {
    return PinTheme(
      width: 50.w,
      height: 60.h,
      textStyle: AppTextStyles.textStyle14.copyWith(
        color: AppColors.rhinoDark.shade500,
      ),
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: AppColors.whiteColor,
        boxShadow: [
          AppShadows.defaultShadow,
          AppShadows.defaultShadow,
        ],
      ),
    );
  }
}
