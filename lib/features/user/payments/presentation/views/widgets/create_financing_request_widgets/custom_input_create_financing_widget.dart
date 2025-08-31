import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/core/widgets/custom_drop_down_field.dart';
import 'package:sanad/features/user/payments/presentation/cubits/create_financing_cubit/create_financing_cubit.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/framework/app_validator.dart';
import '../../../../../../../core/framework/spaces.dart';
import '../../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../../generated/locale_keys.g.dart';

class CustomInputCreateFinancingWidget extends StatelessWidget {
  const CustomInputCreateFinancingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CreateFinancingCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            keyboardType: TextInputType.number,
            ctrl: cubit.nationalIdCtrl,
            fillColor: AppColors.whiteColor,
            validator: AppValidator.defaultValidator,
            hintText: LocaleKeys.nationalId.tr(),
          ),
          heightSpace(10),
          CustomTextFormField(
            ctrl: cubit.dateOfBirthCtrl,
            hintText: LocaleKeys.enterYourDateOfBirth.tr(),
            readOnly: true,
            onTap: () async {
              var date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: DateTime.now(),
                lastDate: DateTime.now(),
              );
              if (date != null) {
                cubit.selectDateOfBirth(date);
              }
            },
            validator: AppValidator.defaultValidator,
          ),
          heightSpace(10),
          CustomTextFormField(
            ctrl: cubit.occupationCtrl,
            hintText: LocaleKeys.enterYourOccupation.tr(),
            validator: AppValidator.defaultValidator,
          ),
          heightSpace(10),
          CustomTextFormField(
            ctrl: cubit.dateOfStartedJobCtrl,
            hintText: LocaleKeys.enterTheDateYouStartedYourCurrentJob.tr(),
            validator: AppValidator.defaultValidator,
            readOnly: true,
            onTap: () async {
              var date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: DateTime.now(),
                lastDate: DateTime.now(),
              );
              if (date != null) {
                cubit.selectDateOfStartedJob(date);
              }
            },
          ),
          heightSpace(10),
          CustomTextFormField(
            ctrl: cubit.salaryCtrl,
            hintText: LocaleKeys.enterYourSalary.tr(),
            keyboardType: TextInputType.number,
            validator: AppValidator.defaultValidator,
            onChanged: (value) {
              cubit.changeValue();
            },
          ),
        ],
      ),
    );
  }
}
