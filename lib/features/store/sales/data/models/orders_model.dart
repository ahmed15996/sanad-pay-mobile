import 'package:json_annotation/json_annotation.dart';
import 'package:sanad/features/store/home/data/models/order_model.dart';
import 'package:sanad/features/user/payments/data/models/payment_model.dart';
part 'orders_model.g.dart';

@JsonSerializable(createToJson: false)
class OrdersModel {
  @JsonKey(name: 'data')
  final List<OrderModel> orders;


  OrdersModel({
    required this.orders,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersModelFromJson(json);
}
