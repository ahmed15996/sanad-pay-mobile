import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanad/core/helpers/url_launcher_helper.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import 'package:sanad/core/widgets/custom_appbar.dart';
import 'package:sanad/core/widgets/custom_error.dart';
import 'package:sanad/core/widgets/custom_loading.dart';
import 'package:sanad/features/user/store_details/data/arguments/store_details_arguments.dart';
import 'package:sanad/features/user/store_details/presentation/cubit/store_details_cubit.dart';
import 'package:sanad/features/user/store_details/presentation/views/widgets/custom_store_details_data_widget.dart';
import 'package:sanad/features/user/store_details/presentation/views/widgets/custom_store_offers_list_widget.dart';
import 'package:sanad/features/user/store_details/presentation/views/widgets/custom_store_working_time_widget.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/widgets/custom_image_network.dart';
import '../../../../../generated/locale_keys.g.dart';

class StoreDetailsView extends StatelessWidget {
  final StoreDetailsArguments arguments;
  const StoreDetailsView({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: CustomAppbar(title: LocaleKeys.storeDetails.tr()),
      body: BlocBuilder<StoreDetailsCubit,StoreDetailsState>(builder: (context, state) {
        var cubit = context.read<StoreDetailsCubit>();
        if(state is GetStoreDetailsLoading){
          return CustomLoading();
        }else if(state is GetStoreDetailsFailure){
          return CustomError(error: state.error, retry: (){
            cubit.fetchStoreDetails(arguments.storeId);
          });
        }else{
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomStoreDetailsDataWidget(storeModel: cubit.storeModel!),
                Row(
                  children: [
                    widthSpace(121.w),
                    Text(
                     LocaleKeys.openMap.tr(),
                      style: AppTextStyles.textStyle12.copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColor,
                        color: AppColors.primaryColor,
                      ),
                    ).onTap(function: () {
                      UrlLauncherHelper.openGoogleMap(cubit.storeModel!.lat, cubit.storeModel!.long);
                    },),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 16.w),
                  child: Divider(
                    thickness: 3,
                    color: AppColors.hintColor,
                  ),
                ),
                CustomStoreWorkingTimeWidget(workingTime: cubit.storeModel!.workingTime!),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 16.w),
                  child: Divider(
                    thickness: 3,
                    color: AppColors.hintColor,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(LocaleKeys.offers.tr(),style: AppTextStyles.textStyle20.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.rhinoDark.shade600
                  ),),
                ),
                heightSpace(16),
                CustomStoreOffersListWidget(offers: cubit.storeModel!.offers!)
            
              ],
            ),
          );
        }
      },)
    );
  }
}
