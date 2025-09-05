import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/framework/app_validator.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../cubit/create_acc_store_cubit.dart';

class CustomStoreWorkingTimeWidget extends StatelessWidget {
  const CustomStoreWorkingTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateAccStoreCubit>();
    return  Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(30.r),
            ),
            padding: EdgeInsetsDirectional.only(
              start: 10.w,
              end: 10.w,
              top: 11.h,
              bottom: 19.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LocaleKeys.jobStartHour.tr(),style: AppTextStyles.textStyle10.copyWith(
                  color: AppColors.hintColor
                ),),
                heightSpace(5.h),
                TextFormField(
                  readOnly: true,
                  onTap: () async{
                    var time = await showTimePicker(context: context, initialTime: cubit.workFrom,initialEntryMode: TimePickerEntryMode.dialOnly,cancelText: LocaleKeys.cancel.tr(),confirmText: LocaleKeys.select.tr());
                    if(time != null){
                      cubit.changeWorkFrom(time);
                    }

                  },
                  validator: AppValidator.startedJobDateValidator,
                  controller: cubit.workFromCtrl,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: cubit.formatTimeOfDayWithPeriod(TimeOfDay(hour: 10, minute: 0)),
                    suffixIcon: SvgPicture.asset(
                      AppAssets.clock,
                      color: AppColors.primaryColor,
                      fit: BoxFit.scaleDown,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),

                )

              ],
            ),


          ),
        ),
        widthSpace(17.w),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(30.r),
            ),
            padding: EdgeInsetsDirectional.only(
              start: 10.w,
              end: 10.w,
              top: 11.h,
              bottom: 19.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LocaleKeys.toHour.tr(),style: AppTextStyles.textStyle10.copyWith(
                  color: AppColors.hintColor
                ),),
                heightSpace(5.h),
                TextFormField(
                  readOnly: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: cubit.workToCtrl,
                  onTap: () async{
                    var time = await showTimePicker(context: context, initialTime: cubit.workTo,initialEntryMode: TimePickerEntryMode.dialOnly,cancelText: LocaleKeys.cancel.tr(),confirmText: LocaleKeys.select.tr());
                    if(time != null){
                      cubit.changeWorkTo(time);
                    }
                  },
                  validator: AppValidator.toHourValidator,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: cubit.formatTimeOfDayWithPeriod(TimeOfDay(hour: 10, minute: 0)),
                    suffixIcon: SvgPicture.asset(
                      AppAssets.clock,
                      color: AppColors.primaryColor,
                      fit: BoxFit.scaleDown,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),

                )

              ],
            ),


          ),
        ),

      ],
    );
  }
}
