import 'package:json_annotation/json_annotation.dart';
import 'package:sanad/features/store/home/data/models/order_model.dart';
import 'package:sanad/features/store/sales/data/models/orders_model.dart';
import 'package:sanad/features/user/payments/data/models/payment_model.dart';
part 'sales_model.g.dart';

@JsonSerializable(createToJson: false)
class SalesModel {
  @JsonKey(name: 'total_sales')
  final num totalSales;
  final OrdersModel orders;


  SalesModel({
    required this.totalSales,
    required this.orders,
  });

  factory SalesModel.fromJson(Map<String, dynamic> json) =>
      _$SalesModelFromJson(json);
}
