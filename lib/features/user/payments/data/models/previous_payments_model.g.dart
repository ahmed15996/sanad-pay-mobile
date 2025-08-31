// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'previous_payments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreviousPaymentsModel _$PreviousPaymentsModelFromJson(
  Map<String, dynamic> json,
) => PreviousPaymentsModel(
  previousPayments: (json['data'] as List<dynamic>)
      .map((e) => PaymentModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);
