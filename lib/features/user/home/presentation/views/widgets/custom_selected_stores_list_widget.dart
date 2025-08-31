import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/features/user/home/data/models/store_model.dart';
import 'package:sanad/features/user/home/presentation/views/widgets/custom_selected_store_item_widget.dart';
import '../../../../../../core/framework/spaces.dart';

class CustomSelectedStoresListWidget extends StatelessWidget {
  final List<StoreModel> selectedStores;
  const CustomSelectedStoresListWidget({super.key, required this.selectedStores});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 75.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemBuilder: (context, index) {
          return CustomSelectedStoreItemWidget(storeModel: selectedStores[index]);
        },
        separatorBuilder: (context, index) {
          return widthSpace(16);
        },
        itemCount: selectedStores.length,
      ),
    );
  }
}
