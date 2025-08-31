import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../core/framework/spaces.dart';
import '../../../data/models/offer_model.dart';
import '../../cubit/offers_cubit.dart';
import 'custom_offer_item_widget.dart';

class CustomOffersListWidget extends StatelessWidget {
  final List<OfferModel> offers;
  const CustomOffersListWidget({super.key, required this.offers});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<OffersCubit>();
    return  SmartRefresher(
      controller: cubit.refreshController,
      onRefresh: () => cubit.refreshOffers(),
      onLoading: () => cubit.paginateOffers(),
      enablePullUp: true,
      child: ListView.separated(itemBuilder: (context, index) {
        return CustomOfferItemWidget(offerModel: offers[index]);
      }, separatorBuilder: (context, index) {
        return heightSpace(16.h);
      }, itemCount: offers.length),
    );
  }
}
