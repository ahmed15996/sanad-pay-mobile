import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/constants/app_colors.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../data/arguments/store_location_argument.dart';
import '../../cubits/select_location_cubit/select_location_cubit.dart';

class CustomCurrentLocationWidget extends StatelessWidget {
  final SelectLocationCubit cubit;
  final void Function(StoreLocationArgument argument) onSelectLocation;

  const CustomCurrentLocationWidget({
    super.key,
    required this.cubit,
    required this.onSelectLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 35.h),
      decoration: BoxDecoration(
        color: Theme.of(context).dialogTheme.backgroundColor,
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(24.r),
          topStart: Radius.circular(24.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            cubit.currentLocationName!,
            textAlign: TextAlign.center,
            style: AppTextStyles.textStyle14.copyWith(
                color: AppColors.blackColor
            ),
          ),
          heightSpace(18.h),
          CustomButton(
            onPressed: () {
              if (cubit.currentLocation != null) {
                onSelectLocation(StoreLocationArgument(
                    address: cubit.currentLocationName.toString(),
                    lat: cubit.currentLocation!.latitude.toString(),
                    long: cubit.currentLocation!.longitude.toString()));
                context.pop();
              }
            },
            text: LocaleKeys.chooseTheSelectedLocation.tr(),
          ),
        ],
      ),
    );
  }
}
