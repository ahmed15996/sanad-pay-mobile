import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/core/constants/app_colors.dart';
import 'package:sanad/core/framework/spaces.dart';
import 'package:sanad/core/widgets/custom_appbar.dart';
import 'package:sanad/core/widgets/custom_empty_data.dart';
import 'package:sanad/core/widgets/custom_error.dart';
import 'package:sanad/core/widgets/custom_loading.dart';
import 'package:sanad/core/widgets/custom_text_form_field.dart';
import 'package:sanad/features/user/home/presentation/views/widgets/custom_selected_stores_list_widget.dart';
import 'package:sanad/features/user/nearby/data/arguments/nearby_arguments.dart';
import 'package:sanad/features/user/nearby/presentation/views/cubit/nearby_cubit.dart';
import 'package:sanad/features/user/nearby/presentation/views/widgets/custom_nearby_stores_list_widget.dart';

import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../generated/locale_keys.g.dart';

class NearbyView extends StatelessWidget {
  final NearbyArguments nearbyArguments;
  const NearbyView({super.key, required this.nearbyArguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: CustomAppbar(
        title: nearbyArguments.isSearch
            ? LocaleKeys.search.tr()
            : LocaleKeys.nearbyStores.tr(),
      ),
      body: BlocBuilder<NearbyCubit, NearbyState>(
        builder: (context, state) {
          var cubit = context.read<NearbyCubit>();
          if (state is GetNearbyLoading) {
            return CustomLoading();
          } else if (state is GetNearbyFailure) {
            return CustomError(
              error: state.error,
              retry: () {
                cubit.fetchNearby();
              },
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightSpace(16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomTextFormField(
                    fillColor: AppColors.whiteColor,
                    prefixIcon: SvgPicture.asset(
                      AppAssets.search,
                      fit: BoxFit.scaleDown,
                    ),
                    ctrl: cubit.searchController,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        cubit.initSearchController(value);
                      }
                    },
                    hintText: LocaleKeys.searchByStoreName.tr(),
                  ),
                ),
                Expanded(
                  child: SmartRefresher(
                    controller: cubit.refreshController,
                    onLoading: () {
                      cubit.paginateNearby();
                    },
                    onRefresh: () {
                      cubit.refreshNearby();
                    },
                    enablePullUp :true ,
                    child: SingleChildScrollView(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        heightSpace(24),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Text(
                            LocaleKeys.selectedStores.tr(),
                            style: AppTextStyles.textStyle16.copyWith(
                              color: AppColors.rhinoDark.shade600,
                            ),
                          ),
                        ),
                        heightSpace(12),
                        CustomSelectedStoresListWidget(
                          selectedStores: cubit.selectedStores,
                        ),
                        if(cubit.stores.isNotEmpty)
                          ...[
                            heightSpace(24),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: Text(
                                LocaleKeys.nearbyStores.tr(),
                                style: AppTextStyles.textStyle16.copyWith(
                                  color: AppColors.darkSecondaryColor,
                                ),
                              ),
                            ),
                            heightSpace(12),
                            CustomNearbyStoresListWidget(stores: cubit.stores),
                          ],
                        if(cubit.stores.isEmpty)
                          CustomEmptyData(
                            text: LocaleKeys.emptySearch.tr(),
                          )
                      ],
                    ),),
                  ),
                )

              ],
            );
          }
        },
      ),
    );
  }
}
