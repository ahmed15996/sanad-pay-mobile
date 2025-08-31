// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionHistoryModel _$TransactionHistoryModelFromJson(
  Map<String, dynamic> json,
) => TransactionHistoryModel(
  transactions: (json['data'] as List<dynamic>)
      .map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);
