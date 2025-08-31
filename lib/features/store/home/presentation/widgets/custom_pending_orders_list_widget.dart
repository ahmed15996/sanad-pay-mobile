import 'package:flutter/material.dart';

import '../../../../../core/framework/spaces.dart';
import '../../data/models/order_model.dart';
import 'custom_latest_order_item_widget.dart';
import 'custom_pending_order_item_widget.dart';

class CustomPendingOrdersListWidget extends StatelessWidget {
  final List<OrderModel> pendingOrders;
  const CustomPendingOrdersListWidget({super.key, required this.pendingOrders});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: pendingOrders.length,
      separatorBuilder: (context, index) => heightSpace(21),
      itemBuilder: (context, index) => CustomPendingOrderItemWidget(orderModel: pendingOrders[index],));
  }
}
