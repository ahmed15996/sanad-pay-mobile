import 'package:json_annotation/json_annotation.dart';
import 'package:sanad/features/user/payments/data/models/payment_model.dart';

part 'upcoming_payments_model.g.dart';

@JsonSerializable(createToJson: false)
class UpcomingPaymentsModel {
  @JsonKey(name: 'can_apply_for_finance')
  final bool canApplyForFinance;
  @JsonKey(name: 'upcoming_payment')
  PaymentModel? upcomingPayment;

  UpcomingPaymentsModel({
    required this.canApplyForFinance,
    this.upcomingPayment,
  });

  factory UpcomingPaymentsModel.fromJson(Map<String, dynamic> json) =>
      _$UpcomingPaymentsModelFromJson(json);
}
