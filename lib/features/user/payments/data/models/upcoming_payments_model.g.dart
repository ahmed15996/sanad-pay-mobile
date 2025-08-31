// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_payments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingPaymentsModel _$UpcomingPaymentsModelFromJson(
  Map<String, dynamic> json,
) => UpcomingPaymentsModel(
  canApplyForFinance: json['can_apply_for_finance'] as bool,
  hasPaidThisMonth: json['has_paid_this_month'] as bool,
  upcomingPayment: json['upcoming_payment'] == null
      ? null
      : PaymentModel.fromJson(json['upcoming_payment'] as Map<String, dynamic>),
);
