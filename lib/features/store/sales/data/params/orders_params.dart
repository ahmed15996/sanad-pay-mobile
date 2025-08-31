import 'package:json_annotation/json_annotation.dart';

part 'orders_params.g.dart';

@JsonSerializable(createFactory: false)
class OrdersParams {
  final String? filter, from, to;
  final int page;

  OrdersParams({this.filter, this.from, this.to,required this.page});

  Map<String, dynamic> toJson() => _$OrdersParamsToJson(this);
}
