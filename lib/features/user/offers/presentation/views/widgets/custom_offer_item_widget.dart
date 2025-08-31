import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/features/user/offers/data/models/offer_model.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/widgets/custom_image_network.dart';
import '../../../../../../generated/locale_keys.g.dart';

class CustomOfferItemWidget extends StatelessWidget {
  final OfferModel offerModel;
  const CustomOfferItemWidget({super.key, required this.offerModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.whiteColor,
      ),
      child: Row(
        children: [
          CustomImageNetwork(image: offerModel.image,radiusValue: 12,widthImage: 90.w,heightImage: 90.h,),
          widthSpace(16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(offerModel.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.textStyle16.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryColor
                      ),),
                    ),
                    Text("${offerModel.discount}% ${LocaleKeys.off.tr()}",style: AppTextStyles.textStyle14.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryColor
                    ),),
                  ],
                ),
                heightSpace(4),
                Text(offerModel.date,style: AppTextStyles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.rhinoDark.shade300
                ),),

              ],
            ),
          )
        ],
      ),
    );
  }
}
