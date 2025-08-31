import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/constants/app_colors.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import 'package:sanad/core/util/routing/routes.dart';
import 'package:sanad/features/user/home/data/models/store_model.dart';
import 'package:sanad/features/user/store_details/data/arguments/store_details_arguments.dart';

import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/widgets/custom_image_network.dart';

class CustomSelectedStoreItemWidget extends StatelessWidget {
  final StoreModel storeModel;
  const CustomSelectedStoreItemWidget({super.key, required this.storeModel});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 62.w,
      child: Column(
        children: [
          CustomImageNetwork(
            image: storeModel.logo,
            widthImage: 50,
            heightImage: 50,
            radiusValue: 25,
          ),
          heightSpace(4),
          Text(storeModel.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: AppTextStyles.textStyle12.copyWith(
            color: AppColors.blackColor
          )),
        ],
      ),
    ).onTap(function: () {
      context.pushWithNamed(Routes.storeDetailsView,arguments: StoreDetailsArguments(storeId: storeModel.id));
    },);
  }
}
