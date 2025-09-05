import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/util/extensions/navigation.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/app_validator.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/util/routing/routes.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../common/auth/presentation/widgets/login_widgets/custom_field_phone_widget.dart';
import '../cubit/create_invoice_cubit.dart';

class CustomCreateInvoiceFormWidget extends StatelessWidget {
  const CustomCreateInvoiceFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CreateInvoiceCubit>();
    return Form(
      key: cubit.formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.payWithBill.tr(),
              style: AppTextStyles.textStyle14.copyWith(
                color: AppColors.blackColor,
              ),
            ),
            heightSpace(31),
            CustomTextFormField(
              hintText: LocaleKeys.billTotal.tr(),
              validator: AppValidator.defaultValidator,
              ctrl: cubit.totalCtrl,

              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 20,
                    width: 1,
                    color: AppColors.hintColor,
                  ),
                  widthSpace(2),
                  SvgPicture.asset(
                    AppAssets.sr,
                    color: AppColors.hintColor,
                  ),
                ],
              ),
            ),
            heightSpace(26),
            CustomFieldPhoneWidget(
              phoneController: cubit.phoneCtrl,
              fillColor: AppColors.whiteColor,
              hintText: LocaleKeys.enterPhoneNumber.tr(),
              prefixWidget: Padding(
                padding:  EdgeInsetsDirectional.only(start: 16.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(AppAssets.saudi),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Text(
                        "+966",
                        style: AppTextStyles.textStyle12.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            heightSpace(51),
            CustomButton(
              text: LocaleKeys.sendRequest.tr(),
              isLoading: cubit.state is CreateInvoiceLoading,
              isDisabled: !cubit.isButtonEnabled,
              onPressed: () {
                bool isPhoneValidated = cubit.phoneCtrl.validatePhoneField();
                if (cubit.formKey.currentState!.validate() &&
                    isPhoneValidated) {
                  cubit.createInvoice(false);
                }
              },
            ),
            heightSpace(40),
            Row(
              children: [
                Expanded(
                  child: Divider(color: AppColors.textColor),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Text(
                    LocaleKeys.or.tr(),
                    style: AppTextStyles.textStyle14.copyWith(
                      color: AppColors.textColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(color: AppColors.textColor),
                ),
              ],
            ),
            heightSpace(40),
            CustomButton(
              backgroundColor: AppColors.secondaryColor,
              onPressed: () {
                if (cubit.formKey.currentState!.validate()) {
                   context.pushWithNamed(
                    Routes.qrScannerView,
                    arguments: cubit.updateBarcode,
                  );
                }
              },
              isLoading: cubit.state is CreateQrInvoiceLoading,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppAssets.qrcode),
                  widthSpace(10.w),
                  Text(
                    LocaleKeys.scanBarcode.tr(),
                    style: AppTextStyles.textStyle16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
