import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/widgets/custom_image_network.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../offers/data/models/offer_model.dart';

class CustomStoreOfferItemWidget extends StatelessWidget {
  final OfferModel offer;
  const CustomStoreOfferItemWidget({super.key, required this.offer});

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
          CustomImageNetwork(
            image: offer.image,
            radiusValue: 12,
            widthImage: 90.w,
            heightImage: 90.h,
          ),
          widthSpace(16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        offer.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.textStyle16.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                    Text(
                      "${offer.discount}% ${LocaleKeys.off.tr()}",
                      style: AppTextStyles.textStyle14.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
                heightSpace(4),
                Text(
                  offer.date,
                  style: AppTextStyles.textStyle14.copyWith(
                    color: AppColors.rhinoDark.shade300,
                  ),
                ),
                heightSpace(10),
                Text(
                  "${offer.price} ${LocaleKeys.sar.tr()}",
                  style: AppTextStyles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.greenColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
