import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/features/user/home/data/models/banner_model.dart';
import 'package:sanad/features/user/home/presentation/views/widgets/custom_slider_item_widget.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../cubit/home_user_cubit.dart';

class CustomSliderAndIndicatorWidget extends StatelessWidget {
  final List<BannerModel> banners;
  const CustomSliderAndIndicatorWidget({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeUserCubit>();
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              cubit.changePageIndex(index);
            },
            disableCenter: true,
            viewportFraction: 1,
            enableInfiniteScroll: true,
            height: 130.h,
            initialPage: cubit.currentPage,
            autoPlay: true,
          ),
          items: List.generate(
            cubit.homeModel!.banners.length,
            (index) => CustomSliderItemWidget(
              bannerModel: cubit.homeModel!.banners[index],
            ),
          ),
        ),
        heightSpace(8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            cubit.homeModel!.banners.length,
            (index) => Container(
              height: cubit.currentPage == index ? 10.h : 8.h,
              width: cubit.currentPage == index ? 10.w : 8.w,
              margin: EdgeInsetsDirectional.only(end: 6.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: cubit.currentPage == index
                    ? AppColors.primaryColor
                    : AppColors.secondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
