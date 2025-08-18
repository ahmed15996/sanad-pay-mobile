import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/widgets/custom_image_network.dart';

class CustomSliderAndIndicatorWidget extends StatelessWidget {
  const CustomSliderAndIndicatorWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    // var cubit = context.read<HomeUserCubit>();
    return Column(
      children: [
        CarouselSlider(

          options: CarouselOptions(
            onPageChanged: (index, reason) {
              // cubit.changePageIndex(index);
            },
            disableCenter: true,
            viewportFraction: 1,
            enableInfiniteScroll: true,
            height: 130.h,
            // initialPage: cubit.currentPage,
            autoPlay: true,
          ),
          items: List.generate(
            4,
            (index) => CustomImageNetwork(image: AppAssets.testImage,radiusValue: 12),
          ),
        ),
        heightSpace(8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            4,
            (index) => Container(
              height: 0 == index ? 10.h : 8.h,
              width: 0 == index ? 10.w : 8.w,
              margin: EdgeInsetsDirectional.only(
                end: 6.w,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: 0 == index
                    ? AppColors.primaryColor
                    : AppColors.secondaryColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
