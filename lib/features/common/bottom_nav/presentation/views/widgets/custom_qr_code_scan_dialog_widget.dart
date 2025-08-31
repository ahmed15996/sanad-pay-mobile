import 'package:barcode_widget/barcode_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/util/extensions/media_query.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import 'package:sanad/core/widgets/custom_error.dart';
import 'package:sanad/core/widgets/custom_loading.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../cubit/bottom_nav_cubit.dart';

class CustomQrCodeScanSheetWidget extends StatefulWidget {
  const CustomQrCodeScanSheetWidget({
    super.key,
  });

  @override
  State<CustomQrCodeScanSheetWidget> createState() => _CustomQrCodeScanSheetWidgetState();
}

class _CustomQrCodeScanSheetWidgetState extends State<CustomQrCodeScanSheetWidget> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<BottomNavCubit>().fetchUserProfile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit,BottomNavState>(builder: (context, state) {
      var cubit = context.read<BottomNavCubit>();
      if(state is UserProfileLoading){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomLoading(),
          ],
        );
      }else if(state is UserProfileFailure){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomError(error: state.error, retry: (){
              cubit.fetchUserProfile();
            }),
          ],
        );
      }else{
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Text(
                    LocaleKeys.myScanner.tr(),
                    style: AppTextStyles.textStyle16.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    AppAssets.cancel,
                    color: AppColors.blackColor,
                    height: 30.h,
                    width: 30.w,
                  ).onTap(function: () {
                    context.pop();
                  }),
                ],
              ),
              heightSpace(45.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 25.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(color: AppColors.primaryColor, width: 3.w)),
                child: BarcodeWidget(
                    barcode: Barcode.code128(),
                    textPadding: 15.h,
                    data: cubit.userModel!.phone,
                    color: AppColors.blackColor,
                    style: AppTextStyles.textStyle16
                        .copyWith(color: AppColors.blackColor) //size: 250,
                ),
              ),
              heightSpace(24.h),
              Text(
                cubit.userModel!.name,
                style: AppTextStyles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600, color: AppColors.blackColor),
              ),
              heightSpace(16.h),
              Text(
                LocaleKeys.doNotShareScan.tr(),
                textAlign: TextAlign.center,
                style: AppTextStyles.textStyle14.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.blackColor),
              ),
              heightSpace(context.height * 0.064),
              CustomButton(
                onPressed: () {
                  context.pop();
                },
                text: LocaleKeys.done.tr(),
              )
            ],
          ),
        );
      }
    },);
  }
}
