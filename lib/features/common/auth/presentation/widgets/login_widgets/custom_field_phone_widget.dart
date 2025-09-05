import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/constants/app_shadows.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';

import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/helpers/custom_phone_controller.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../generated/locale_keys.g.dart';

class CustomFieldPhoneWidget extends StatefulWidget {
  final PhoneFieldController phoneController;
  final double? paddingVerticalValue, borderRadiusValue;
  final bool isHide,isEnabled;
  final Color? fillColor, borderColor;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final String? hintText;

  const CustomFieldPhoneWidget({
    super.key,
    required this.phoneController,
    this.paddingVerticalValue,
    this.borderRadiusValue,
    this.isHide = false,
    this.isEnabled = true,
    this.fillColor,
    this.borderColor,
    this.suffixWidget,
    this.prefixWidget,
    this.hintText,
  });

  @override
  State<CustomFieldPhoneWidget> createState() => _CustomFieldPhoneWidgetState();
}

class _CustomFieldPhoneWidgetState extends State<CustomFieldPhoneWidget> {
  void _controllerListener() {
    setState(() {});
  }

  @override
  void initState() {
    widget.phoneController.addListener(_controllerListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.phoneController.removeListener(_controllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: widget.fillColor,
            boxShadow: [
              AppShadows.defaultShadow
            ],
            borderRadius: BorderRadius.circular(
              widget.borderRadiusValue ?? 30.r,
            ),
            border: Border.all(
              color: widget.borderColor ?? borderColor(isHide: widget.isHide),
            ),
          ),
          child: TextFormField(
            enabled: widget.isEnabled,
            controller: widget.phoneController.controller,

            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.darkSecondaryColor
            ),
            onChanged: (String? value) {
              if (value != null) {
                widget.phoneController.validatePhoneField();
              }
            },
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              hintText: widget.hintText ?? LocaleKeys.mobileNumber.tr(),
              enabledBorder: buildOutlineInputBorder(
                widget.borderColor
              ),
              focusedBorder: buildOutlineInputBorder(
                  widget.borderColor
              ),
              prefixIcon: widget.prefixWidget  ?? SvgPicture.asset(AppAssets.phone,fit: BoxFit.scaleDown,),
              suffixIcon: widget.suffixWidget,
              contentPadding: EdgeInsets.symmetric(
                vertical: 17.h,
                horizontal: 20.w,
              ),
            ),
          ),
        ),
        if (widget.phoneController.phoneFieldBorder ==
            PhoneFieldBorder.error) ...[
          heightSpace(10),
          Text(
            widget.phoneController.errorMessage,
            style: AppTextStyles.textStyle12.copyWith(
              color: AppColors.redColor,
            ),
          ),
        ],
      ],
    );
  }

  Color borderColor({required bool isHide}) {
    switch (widget.phoneController.phoneFieldBorder) {
      case PhoneFieldBorder.initial:
        return AppColors.transparentColor;
      case PhoneFieldBorder.error:
        return AppColors.redColor;
      case PhoneFieldBorder.validated:
        return isHide ? AppColors.whiteColor : AppColors.transparentColor;
    }
  }
}
