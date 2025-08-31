import 'package:json_annotation/json_annotation.dart';

part 'payment_model.g.dart';

@JsonSerializable(createToJson: false)
class PaymentModel {
  final int id;
  final String amount,date;

  PaymentModel({
    required this.id,
    required this.amount,
    required this.date
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
}
