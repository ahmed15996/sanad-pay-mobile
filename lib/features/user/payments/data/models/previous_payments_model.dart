import 'package:json_annotation/json_annotation.dart';
import 'package:sanad/features/user/payments/data/models/payment_model.dart';
part 'previous_payments_model.g.dart';

@JsonSerializable(createToJson: false)
class PreviousPaymentsModel {
  @JsonKey(name: 'data')
  final List<PaymentModel> previousPayments;


  PreviousPaymentsModel({
    required this.previousPayments
  });

  factory PreviousPaymentsModel.fromJson(Map<String, dynamic> json) =>
      _$PreviousPaymentsModelFromJson(json);
}
