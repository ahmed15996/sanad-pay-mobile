import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../core/framework/spaces.dart';
import '../../../../home/data/models/store_model.dart';
import '../cubit/nearby_cubit.dart';
import 'custom_nearby_store_search_item_widget.dart';

class CustomNearbyStoresListWidget extends StatelessWidget {
  final List<StoreModel> stores;
  const CustomNearbyStoresListWidget({super.key, required this.stores});

  @override
  Widget build(BuildContext context) {

    return  ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CustomNearbyStoreSearchItemWidget(storeModel: stores[index]);
      },
      separatorBuilder: (context, index) {
        return heightSpace(16);
      },
      itemCount: stores.length,
    );
  }
}
