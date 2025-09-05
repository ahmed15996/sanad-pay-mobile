import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/di/di.dart';
import 'package:sanad/core/widgets/custom_appbar.dart';
import 'package:sanad/core/widgets/custom_image_network.dart';
import 'package:sanad/core/widgets/custom_loading.dart';
import 'package:sanad/features/store/sales/presentation/cubit/sales_cubit.dart';
import 'package:sanad/features/store/sales/presentation/widgets/custom_sales_data_widget.dart';
import 'package:sanad/features/store/sales/presentation/widgets/custom_sales_list_widget.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/widgets/custom_error.dart';
import '../../../../../generated/locale_keys.g.dart';

class SalesView extends StatelessWidget {
  const SalesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SalesCubit>()..fetchDashboard(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: CustomAppbar(
          title: LocaleKeys.sales.tr(),
          leadingWidth: 80.w,
          systemUiOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
          ),
          leading: BlocBuilder<SalesCubit, SalesState>(
            builder: (context, state) {
              var cubit = context.read<SalesCubit>();
              if (cubit.userModel != null) {
                return Padding(
                  padding: EdgeInsets.all(20.w),
                  child: CustomImageNetwork(
                    image: cubit.userModel!.image,
                    widthImage: 24.w,
                    heightImage: 24.h,
                    radiusValue: 12,
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
        body: BlocBuilder<SalesCubit, SalesState>(
          builder: (context, state) {
            var cubit = context.read<SalesCubit>();
            if (state is GetSalesDataLoading) {
              return CustomLoading();
            } else if (state is GetSalesDataFailure) {
              return CustomError(
                error: state.error,
                retry: () {
                  cubit.fetchDashboard();
                },
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heightSpace(32),
                  CustomSalesDataWidget(dashboardModel: cubit.dashboardModel!),
                  heightSpace(34),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.todayTotalSales.tr(),
                              style: AppTextStyles.textStyle14.copyWith(
                                color: AppColors.blackColor,
                              ),
                            ),
                            heightSpace(8),
                            Row(
                              children: [
                                Text(
                                  "${cubit.ordersModel!.totalSales}",
                                  style: AppTextStyles.textStyle14.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                widthSpace(2),
                                SvgPicture.asset(
                                  AppAssets.sr,
                                  color: AppColors.blackColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Container(
                        //   padding: EdgeInsets.all(10.w),
                        //   decoration: BoxDecoration(
                        //     color: AppColors.lighterGreyColor,
                        //     borderRadius: BorderRadius.circular(16.w),
                        //   ),
                        //   child: SvgPicture.asset(AppAssets.filter),
                        // ),
                      ],
                    ),
                  ),
                  heightSpace(24),
                  CustomSalesListWidget(orders: cubit.orders),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
