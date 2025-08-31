import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/core/widgets/custom_drop_down_field.dart';
import 'package:sanad/features/user/create_acc_user/data/models/city_model.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/app_validator.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../cubit/create_acc_user_cubit.dart';

class CustomInputCreateAccUserWidget extends StatelessWidget {
  const CustomInputCreateAccUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CreateAccUserCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            keyboardType: TextInputType.name,
            ctrl: cubit.nameCtrl,
            prefixIcon: SvgPicture.asset(AppAssets.user, fit: BoxFit.scaleDown),
            fillColor: AppColors.whiteColor,
            validator: AppValidator.nameValidator,
            hintText: LocaleKeys.enterFullName.tr(),
          ),
          heightSpace(20),
          CustomTextFormField(
            ctrl: cubit.emailCtrl,
            prefixIcon: SvgPicture.asset(
              AppAssets.email,
              fit: BoxFit.scaleDown,
            ),
            suffixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsetsDirectional.only(end: 24.w),
                  child: Text(
                    LocaleKeys.optional.tr(),
                    style: AppTextStyles.textStyle12.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor.withOpacity(0.6),
                    ),
                  ),
                ),
              ],
            ),
            hintText: LocaleKeys.enterYourEmailAddress.tr(),
            keyboardType: TextInputType.emailAddress,
            validator: AppValidator.emailValidator,
          ),
          heightSpace(20),
          CustomDropDownField<CityModel>(
            items: cubit.cities,

            onChanged: (CityModel? value) {
              cubit.changeCityValue(value!);
            },
            headerBuilder: (p0, city, p2) {
              return Text(city.name);
            },
            listItemBuilder: (p0, city, p2, p3) {
              return Text(city.name);
            },
            fillColor: AppColors.whiteColor,
            borderColor: AppColors.transparentColor,

            prefixIcon: SvgPicture.asset(
              AppAssets.city,
              fit: BoxFit.scaleDown,
            ),
            hintText: LocaleKeys.city.tr(),
            value: cubit.selectedCityId,
            validator: (value) {
              return AppValidator.defaultValidator(value?.name);
            },
          ),
        ],
      ),
    );
  }
}
