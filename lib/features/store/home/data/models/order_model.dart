import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable(createToJson: false)
class OrderModel {
  final int id;
  @JsonKey(name: 'user_name')
  final String? userName;
  @JsonKey(name: 'store_name')
  final String? storeName;
  @JsonKey(name: 'store_owner')
  final String? storeOwner;
  @JsonKey(name: 'store_commercial_number')
  final String? storeCommercialNumber;
  @JsonKey(name: 'reference_no')
  final String? referenceNumber;
  final String? time;

  final String total,status,date;

  OrderModel({
    required this.id,
    this.userName,
    required this.total,
    required this.status,
    required this.date,
    this.storeName,
    this.storeOwner,
    this.storeCommercialNumber,
    this.referenceNumber,
    this.time,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
