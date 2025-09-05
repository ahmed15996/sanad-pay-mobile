import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/core/widgets/custom_empty_data.dart';
import 'package:sanad/core/widgets/custom_error.dart';
import 'package:sanad/core/widgets/custom_loading.dart';
import 'package:sanad/features/user/offers/presentation/views/widgets/custom_offers_list_widget.dart';
import 'package:sanad/generated/locale_keys.g.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_shadows.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/di/di.dart';
import '../cubit/offers_cubit.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,

      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<OffersCubit>()..fetchOffers(),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 24.w, top: 30.h),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      LocaleKeys.offers.tr(),
                      style: AppTextStyles.textStyle20.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.rhinoDark.shade600,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor.withOpacity(0.4),
                    boxShadow: [AppShadows.offerContainerShadow],
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24.r),
                    ),
                  ),
                  child: BlocBuilder<OffersCubit, OffersState>(
                    builder: (context, state) {
                      var cubit = context.read<OffersCubit>();
                      if (state is GetOffersLoading) {
                        return CustomLoading();
                      } else if (state is GetOffersFailure) {
                        return CustomError(
                          error: state.error,
                          retry: () {
                            cubit.fetchOffers();
                          },
                        );
                      } else {
                        return cubit.offers.isEmpty
                            ? CustomEmptyData(
                                text: LocaleKeys.comingSoonOffer.tr(),
                                image: AppAssets.emptyOffers,
                              )
                            : CustomOffersListWidget(offers: cubit.offers);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
