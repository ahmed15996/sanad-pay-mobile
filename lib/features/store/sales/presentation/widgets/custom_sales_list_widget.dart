import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sanad/core/widgets/custom_header_pagination_widget.dart';
import 'package:sanad/features/store/sales/data/models/sales_model.dart';

import '../../../../../core/framework/spaces.dart';
import '../../../../../core/widgets/custom_footer_pagination_widget.dart';
import '../../../home/data/models/order_model.dart';
import '../cubit/sales_cubit.dart';
import 'custom_sales_item_widget.dart';

class CustomSalesListWidget extends StatelessWidget {
  final List<OrderModel> orders;
  const CustomSalesListWidget({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: orders.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsetsDirectional.only(start: 24.w,end: 24.w,bottom: 100.h,top: 16.h),
      separatorBuilder: (context, index) => heightSpace(21),
      itemBuilder: (context, index) => CustomSalesItemWidget(orderModel: orders[index],),
    );
  }
}
