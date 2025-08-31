import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/features/store/create_acc/presentation/views/widgets/custom_store_working_time_widget.dart';
import 'package:sanad/features/user/create_acc_user/data/models/city_model.dart';
import 'package:sanad/features/user/home/data/models/category_model.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/app_validator.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/util/routing/routes.dart';
import '../../../../../../core/widgets/custom_drop_down_field.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../cubit/create_acc_store_cubit.dart';
import 'custom_image_file_pick_widget.dart';

class CustomInputStoreCreateAccWidget extends StatelessWidget {
  final CreateAccStoreCubit cubit;

  const CustomInputStoreCreateAccWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Text(
            LocaleKeys.enterStoreInformation.tr(),
            style: AppTextStyles.textStyle16.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),
        ),
        heightSpace(20),
        CustomTextFormField(
          keyboardType: TextInputType.name,
          ctrl: cubit.storeNameCtrl,
          hintText: LocaleKeys.enterStoreName.tr(),
          validator: AppValidator.defaultValidator,
        ),
        heightSpace(17.h),
        CustomTextFormField(
          readOnly: true,
          ctrl: cubit.storeLogoCtrl,
          hintText: LocaleKeys.attachStoreImageOrLogo.tr(),
          validator: AppValidator.defaultValidator,
          suffixIcon: SvgPicture.asset(AppAssets.upload, fit: BoxFit.scaleDown),
          onTap: () async {
            cubit.pickImage(context: context, type: 1);
          },
        ),
        if (cubit.storeImage != null)
          CustomImageFilePickWidget(
            file: cubit.storeImage!,
            deleteImage: () {
              cubit.deleteImage(type: 1);
            },
          ),
        heightSpace(17.h),
        CustomTextFormField(
          readOnly: true,
          ctrl: cubit.storeLocationCtrl,
          hintText: LocaleKeys.detectStoreLocationOnMap.tr(),
          validator: AppValidator.defaultValidator,
          suffixIcon: SvgPicture.asset(
            AppAssets.selectLocation,
            fit: BoxFit.scaleDown,
          ),
          onTap: () {
            if (context.mounted) {
              context.pushWithNamed(
                Routes.selectLocationView,
                arguments: cubit.updateLocationData,
              );
            }
          },
        ),
        heightSpace(17.h),
        CustomDropDownField<CategoryModel>(
          value: cubit.selectedCategoryId,
          hintText: LocaleKeys.selectStoreCategory.tr(),
          validator: (value) {
            return AppValidator.defaultValidator(value?.name);
          },
          items: cubit.categories,
          headerBuilder: (p0, category, p2) {
            return Text(category.name);
          },
          listItemBuilder: (p0, category, p2, p3) {
            return Text(category.name);
          },
          onChanged: (value) {
            cubit.changeCategoryValue(value!);
          },
        ),
        heightSpace(17.h),
        CustomTextFormField(
          ctrl: cubit.branchesCountCtrl,
          hintText: LocaleKeys.enterStoreBranchesNumber.tr(),
          suffixIcon: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "(${LocaleKeys.optional.tr()})",
                  style: AppTextStyles.textStyle14.copyWith(
                    color: AppColors.hintColor,
                  ),
                ),
              ),
            ],
          ),
        ),

        heightSpace(17.h),
        CustomTextFormField(
          ctrl: cubit.descriptionCtrl,
          hintText: LocaleKeys.enterStoreDescription.tr(),
          maxLength: 200,
          maxLines: 5,
          validator: AppValidator.defaultValidator,
        ),
        heightSpace(17.h),
        CustomDropDownField<CityModel>(
          value: cubit.selectedCityId,
          hintText: LocaleKeys.selectYourCity.tr(),
          validator: (value) {
            return AppValidator.defaultValidator(value?.name);
          },
          headerBuilder: (p0, city, p2) {
            return Text(city.name);
          },
          listItemBuilder: (p0, city, p2, p3) {
            return Text(city.name);
          },
          items: cubit.cities,
          prefixIcon: SvgPicture.asset(AppAssets.city,fit: BoxFit.scaleDown,),
          onChanged: (value) {
            cubit.changeCityValue(value!);
          },
        ),
        heightSpace(17.h),
        CustomTextFormField(
          ctrl: cubit.addressCtrl,
          hintText: LocaleKeys.enterYourAddressWithStreetAndDistrict.tr(),
          validator: AppValidator.defaultValidator,
        ),
        heightSpace(17.h),
        CustomStoreWorkingTimeWidget(),
      ],
    );
  }
}
