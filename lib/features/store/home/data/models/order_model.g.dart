// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
  id: (json['id'] as num).toInt(),
  userName: json['user_name'] as String?,
  total: json['total'] as String,
  status: json['status'] as String,
  date: json['date'] as String,
  storeName: json['store_name'] as String?,
  storeLogo: json['store_logo'] as String?,
  storeOwner: json['store_owner'] as String?,
  storeCommercialNumber: json['store_commercial_number'] as String?,
  referenceNumber: json['reference_no'] as String?,
  time: json['time'] as String?,
);
