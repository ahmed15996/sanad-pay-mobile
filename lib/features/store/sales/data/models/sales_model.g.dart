// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesModel _$SalesModelFromJson(Map<String, dynamic> json) => SalesModel(
  totalSales: json['total_sales'] as num,
  orders: OrdersModel.fromJson(json['orders'] as Map<String, dynamic>),
);
