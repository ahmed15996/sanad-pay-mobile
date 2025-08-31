import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/framework/spaces.dart';
import '../../../../../../../core/widgets/custom_image_network.dart';
import '../../../../../../store/home/data/models/order_model.dart';

class CustomPaymentRequestStoreDataWidget extends StatelessWidget {
  final OrderModel orderModel;
  const CustomPaymentRequestStoreDataWidget({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        CustomImageNetwork(image: AppAssets.testImage,widthImage: 56.w,heightImage: 56.h,),
        widthSpace(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(orderModel.storeName ?? "",style: AppTextStyles.textStyle14.copyWith(color: AppColors.rhinoDark.shade500,fontWeight: FontWeight.w600),),
            heightSpace(4.h),
            Text("${orderModel.storeOwner} - ${orderModel.storeCommercialNumber}",style: AppTextStyles.textStyle12.copyWith(color: AppColors.rhinoDark.shade300),),
          ],
        )
      ],
    );
  }
}
