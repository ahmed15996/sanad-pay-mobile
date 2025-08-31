import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/core/constants/app_colors.dart';
import 'package:sanad/core/framework/spaces.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import 'package:sanad/core/util/routing/routes.dart';
import 'package:sanad/core/widgets/custom_error.dart';
import 'package:sanad/core/widgets/custom_loading.dart';
import 'package:sanad/core/widgets/custom_text_form_field.dart';
import 'package:sanad/features/user/home/presentation/cubit/home_user_cubit.dart';
import 'package:sanad/features/user/home/presentation/views/widgets/custom_categories_list_widget.dart';
import 'package:sanad/features/user/home/presentation/views/widgets/custom_incomplete_national_id_verification_widget.dart';
import 'package:sanad/features/user/home/presentation/views/widgets/custom_nearby_stores_grid_widget.dart';
import 'package:sanad/features/user/home/presentation/views/widgets/custom_selected_stores_list_widget.dart';
import 'package:sanad/features/user/home/presentation/views/widgets/custom_slider_and_indicator_widget.dart';
import 'package:sanad/features/user/home/presentation/views/widgets/custom_user_data_widget.dart';
import 'package:sanad/features/user/nearby/data/arguments/nearby_arguments.dart';

import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/di/di.dart';
import '../../../../../generated/locale_keys.g.dart';

class HomeUserView extends StatelessWidget {
  const HomeUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => getIt<HomeUserCubit>()..fetchHome(),
        child: BlocBuilder<HomeUserCubit, HomeUserState>(
          builder: (context, state) {
            final cubit = context.read<HomeUserCubit>();
            if (state is GetHomeDataLoading) {
              return CustomLoading();
            } else if (state is GetHomeDataFailure) {
              return CustomError(
                error: state.error,
                retry: () {
                  cubit.fetchHome();
                },
              );
            } else {
              return SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomUserDataWidget(
                        userModel: cubit.userModel,
                      ),
                      heightSpace(16),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 24.w),
                        child: CustomTextFormField(
                          fillColor: AppColors.whiteColor,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) {
                            if(value.isNotEmpty){
                              context.pushWithNamed(Routes.nearbyView,arguments: NearbyArguments(key: value,isSearch: true));
                            }
                          },
                          prefixIcon: SvgPicture.asset(AppAssets.search,fit: BoxFit.scaleDown,),
                          hintText: LocaleKeys.search.tr(),
                        ),
                      ),
                      if(cubit.userModel?.nationalIdVerified == false)
                      ...[
                        heightSpace(24),
                        CustomIncompleteNationalIdVerificationWidget(),
                      ],
                      heightSpace(16),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          LocaleKeys.selectedStores.tr(),
                          style: AppTextStyles.textStyle16.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.rhinoDark.shade500,
                          ),
                        ),
                      ),
                      heightSpace(12),
                      CustomSelectedStoresListWidget(
                        selectedStores: cubit.homeModel!.selectedStores,
                      ),
                      heightSpace(16),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          LocaleKeys.categories.tr(),
                          style: AppTextStyles.textStyle16.copyWith(
                            color: AppColors.rhinoDark.shade500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      heightSpace(12),
                      CustomCategoriesListWidget(
                        categories: cubit.homeModel!.categories,
                      ),
                      heightSpace(24),
                      CustomSliderAndIndicatorWidget(
                        banners: cubit.homeModel!.banners,
                      ),
                      heightSpace(24),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          LocaleKeys.nearbyStores.tr(),
                          style: AppTextStyles.textStyle16.copyWith(
                            color: AppColors.rhinoDark.shade500,
                            fontWeight: FontWeight.w600,
                          ),
                        ).onTap(function: () {
                          context.pushWithNamed(Routes.nearbyView,arguments: NearbyArguments(isSearch: false));

                        },),
                      ),
                      heightSpace(12),
                      CustomNearbyStoresGridWidget(
                        nearbyStores: cubit.homeModel!.nearbyStores,
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
