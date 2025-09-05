import 'package:flutter/material.dart';

import '../../../../../core/framework/spaces.dart';
import '../../data/models/order_model.dart';
import 'custom_latest_order_item_widget.dart';

class CustomLatestOrdersListWidget extends StatelessWidget {
  final List<OrderModel> latestOrders;
  const CustomLatestOrdersListWidget({super.key, required this.latestOrders});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: latestOrders.length,

      separatorBuilder: (context, index) => heightSpace(21),
      itemBuilder: (context, index) =>
          CustomLatestOrderItemWidget(orderModel: latestOrders[index]),
    );
  }
}
