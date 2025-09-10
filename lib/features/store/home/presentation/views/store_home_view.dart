import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/constants/app_text_styles.dart';
import 'package:sanad/core/di/di.dart';
import 'package:sanad/core/framework/spaces.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import 'package:sanad/features/common/bottom_nav/presentation/cubit/bottom_nav_cubit.dart';
import 'package:sanad/features/store/home/presentation/widgets/custom_latest_orders_list_widget.dart';
import 'package:sanad/features/store/home/presentation/widgets/custom_pending_orders_list_widget.dart';
import 'package:sanad/features/store/home/presentation/widgets/custom_store_dashboard_widget.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_error.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../cubit/home_store_cubit.dart';

class StoreHomeView extends StatelessWidget {
  const StoreHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<HomeStoreCubit>()..fetchDashboard(),
        child: BlocBuilder<HomeStoreCubit, HomeStoreState>(
          builder: (context, state) {
            var cubit = context.read<HomeStoreCubit>();
            if (state is GetStoreHomeDataLoading) {
              return CustomLoading();
            } else if (state is GetStoreHomeDataFailure) {
              return CustomError(
                error: state.error,
                retry: () {
                  cubit.fetchDashboard();
                },
              );
            } else {
              return SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomStoreDashboardWidget(
                        dashboardModel: cubit.dashboardModel!,
                        userModel: cubit.userModel!,
                        appSettingsModel: cubit.appSettingsModel!,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 20.h,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24.r),
                          ),
                        ),
                        child:
                            cubit.dashboardModel!.pendingOrders.isNotEmpty ||
                                cubit.dashboardModel!.latestOrders.isNotEmpty
                            ? SingleChildScrollView(
                              padding: EdgeInsets.only(
                                bottom: 100.h
                              ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (cubit
                                        .dashboardModel!
                                        .pendingOrders
                                        .isNotEmpty) ...[
                                      Text(
                                        LocaleKeys.pendingOrders.tr(),
                                        style: AppTextStyles.textStyle14
                                            .copyWith(
                                              color: AppColors.blackColor,
                                            ),
                                      ),
                                      heightSpace(24),
                                      CustomPendingOrdersListWidget(
                                        pendingOrders:
                                            cubit.dashboardModel!.pendingOrders,
                                      ),
                                    ],
                                    if (cubit
                                        .dashboardModel!
                                        .latestOrders
                                        .isNotEmpty) ...[
                                      heightSpace(43),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                           LocaleKeys.latestOrders.tr(),
                                            style: AppTextStyles.textStyle14
                                                .copyWith(
                                                  color: AppColors.blackColor,
                                                ),
                                          ),
                                          Text(
                                            LocaleKeys.showAll.tr(),
                                            style: AppTextStyles.textStyle14
                                                .copyWith(
                                                  color: AppColors.blackColor,
                                                ),
                                          ).onTap(
                                            function: () {
                                              context
                                                  .read<BottomNavCubit>()
                                                  .changeNavIndex(index: 2);

                                            },
                                          ),
                                        ],
                                      ),
                                      heightSpace(23),
                                      CustomLatestOrdersListWidget(
                                        latestOrders:
                                            cubit.dashboardModel!.latestOrders,
                                      ),
                                    ],
                                  ],
                                ),
                              )
                            : Center(
                                child: Text(
                                  LocaleKeys.noNewOrdersYet.tr(),
                                  style: AppTextStyles.textStyle14.copyWith(
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
