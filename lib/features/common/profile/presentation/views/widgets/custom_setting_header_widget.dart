import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child:  Row(
              children: [
                if (cubit.userModel?.role == "store") ...[
                  Container(
                    width: 32.w,
                    height: 32.h,
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackColor.withOpacity(0.12),
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: const Offset(1, 2),
                        )
                      ],
                    ),
                    child: CustomImageNetwork(image: cubit.userModel!.image),
                  ),
                  widthSpace(8.w),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cubit.userModel!.role != "store"
                            ? cubit.userModel!.name ?? ""
                            : cubit.userModel!.name ?? "",
                        style: AppTextStyles.textStyle16.copyWith(
                          fontWeight: FontWeight.w600,
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
