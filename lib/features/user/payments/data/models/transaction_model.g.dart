// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      id: (json['id'] as num).toInt(),
      amount: json['amount'] as String,
      date: json['date'] as String,
      store: StoreModel.fromJson(json['store'] as Map<String, dynamic>),
    );
