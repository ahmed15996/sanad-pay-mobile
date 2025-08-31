import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/features/user/store_details/presentation/views/widgets/custom_store_offer_item_widget.dart';

import '../../../../../../core/framework/spaces.dart';
import '../../../../offers/data/models/offer_model.dart';

class CustomStoreOffersListWidget extends StatelessWidget {
  final List<OfferModel> offers;
  const CustomStoreOffersListWidget({super.key, required this.offers});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
      return CustomStoreOfferItemWidget(offer: offers[index]);
    }, separatorBuilder: (context, index) {
      return heightSpace(16);
    }, itemCount: offers.length);
  }
}
