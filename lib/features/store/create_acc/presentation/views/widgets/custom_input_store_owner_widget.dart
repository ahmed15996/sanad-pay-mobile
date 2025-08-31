import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/core/constants/app_colors.dart';

import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/app_validator.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../common/auth/presentation/widgets/login_widgets/custom_field_phone_widget.dart';
import '../../cubit/create_acc_store_cubit.dart';
import 'custom_image_file_pick_widget.dart';

class CustomInputStoreOwnerWidget extends StatelessWidget {
  const CustomInputStoreOwnerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CreateAccStoreCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsetsDirectional.only(start: 25.w),
          child: Text(
            LocaleKeys.ownerInformationForCommercial.tr(),
            style: AppTextStyles.textStyle16.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor
            ),
          ),
        ),

        heightSpace(39),
        CustomTextFormField(
          ctrl: cubit.storeOwnerNameCtrl,
          validator: AppValidator.defaultValidator,
          hintText: LocaleKeys.enterStoreOwnerName.tr(),
        ),
        heightSpace(16),
        CustomFieldPhoneWidget(
          phoneController: cubit.phoneCtrl,
          showPrefix: false,
          fillColor: AppColors.whiteColor,
          hintText: LocaleKeys.enterPhoneNumber.tr(),
          suffixWidget: Padding(
            padding:  EdgeInsetsDirectional.only(end: 24.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "+966",
                  style: AppTextStyles.textStyle12.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: SvgPicture.asset(AppAssets.saudi),
                )
              ],
            ),
          ),
        ),
        heightSpace(16),
        CustomTextFormField(
          ctrl: cubit.commerceNumCtrl,
          validator: AppValidator.defaultValidator,
          hintText: LocaleKeys.enterCommercialNumber.tr(),
        ),
        heightSpace(16),
        CustomTextFormField(
          readOnly: true,
          ctrl: cubit.imageCommerceCtrl,
          validator: AppValidator.defaultValidator,
          hintText: LocaleKeys.attachCommercialImage.tr(),
          onTap: () {
            cubit.pickImage(context: context,type: 0);
          },
          suffixIcon: SvgPicture.asset(AppAssets.attach,fit: BoxFit.scaleDown,) ,
        ),
        heightSpace(16),
        if (cubit.imageCommerce != null)
          CustomImageFilePickWidget(
            file: cubit.imageCommerce!,
            deleteImage: () {
              cubit.deleteImage(type: 0);
            },
          ),
      ],
    );
  }
}


