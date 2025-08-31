import 'package:json_annotation/json_annotation.dart';
import 'package:sanad/features/store/home/data/models/order_model.dart';
import 'package:sanad/features/user/home/data/models/banner_model.dart';
import 'package:sanad/features/user/home/data/models/category_model.dart';
import 'package:sanad/features/user/home/data/models/store_model.dart';

part 'dashboard_model.g.dart';

@JsonSerializable(createToJson: false)
class DashboardModel {
  @JsonKey(name: 'today_sales')
  num todaySales;
  @JsonKey(name: 'month_sales')
  num monthSales;

  @JsonKey(name: 'pending_orders')
  final List<OrderModel> pendingOrders;
  @JsonKey(name: 'latest_orders')
  final List<OrderModel> latestOrders;

  DashboardModel({
    required this.todaySales,
    required this.monthSales,
    required this.pendingOrders,
    required this.latestOrders,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);
}
