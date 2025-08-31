import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/features/user/home/data/models/store_model.dart';
import 'package:sanad/features/user/home/presentation/views/widgets/custom_nearby_store_item_widget.dart';


class CustomNearbyStoresGridWidget extends StatelessWidget {
  final List<StoreModel> nearbyStores;
  const CustomNearbyStoresGridWidget({super.key, required this.nearbyStores});

  @override
  Widget build(BuildContext context) {
    return  GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16.h,
      crossAxisSpacing: 35.w,
      shrinkWrap: true,
      childAspectRatio: 146.w / 132.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(
        nearbyStores.length,
            (index) => CustomNearbyStoreItemWidget(storeModel: nearbyStores[index])
      ),
    );
  }
}
