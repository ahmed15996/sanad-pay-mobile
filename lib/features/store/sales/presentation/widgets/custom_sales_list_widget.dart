import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sanad/features/store/sales/data/models/sales_model.dart';

import '../../../../../core/framework/spaces.dart';
import '../../../home/data/models/order_model.dart';
import '../cubit/sales_cubit.dart';
import 'custom_sales_item_widget.dart';

class CustomSalesListWidget extends StatelessWidget {
  final List<OrderModel> orders;
  const CustomSalesListWidget({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SalesCubit>();
    return Expanded(
      child: SmartRefresher(
        controller: cubit.ordersRefreshController,
        onRefresh: () {
          cubit.refreshSales();
        },
        onLoading: () {
          cubit.paginateSales();
        },
        enablePullUp: true,
        child: ListView.separated(
          itemCount: orders.length,
          padding: EdgeInsetsDirectional.only(start: 24.w,end: 24.w,bottom: 60.h,top: 16.h),
          separatorBuilder: (context, index) => heightSpace(21),
          itemBuilder: (context, index) => CustomSalesItemWidget(orderModel: orders[index],),
        ),
      ),
    );
  }
}
