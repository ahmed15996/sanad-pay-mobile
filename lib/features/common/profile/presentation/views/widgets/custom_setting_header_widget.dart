import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/util/extensions/media_query.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/widgets/custom_image_network.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../cubit/profile_cubit.dart';

class CustomSettingHeaderWidget extends StatelessWidget {
  final ProfileCubit cubit;

  const CustomSettingHeaderWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 16.w),
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.whiteColor
      ),
      child:  Row(
              children: [

                  if(cubit.userModel != null)...[
                    CustomImageNetwork(image: cubit.userModel!.image,radiusValue: 16,widthImage: 32.w,heightImage: 32.h,),
                    widthSpace(8.w),
                  ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cubit.userModel?.name ?? LocaleKeys.login.tr(),
                        style: AppTextStyles.textStyle16.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor
                        ),
                      ),

                    ],
                  )
                ),

              ],
            )

    );
  }
}
