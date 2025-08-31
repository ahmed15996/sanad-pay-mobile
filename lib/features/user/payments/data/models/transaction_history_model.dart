import 'package:json_annotation/json_annotation.dart';
import 'package:sanad/features/user/payments/data/models/payment_model.dart';
import 'package:sanad/features/user/payments/data/models/transaction_model.dart';
part 'transaction_history_model.g.dart';

@JsonSerializable(createToJson: false)
class TransactionHistoryModel {
  @JsonKey(name: 'data')
  final List<TransactionModel> transactions;


  TransactionHistoryModel({
    required this.transactions
  });

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryModelFromJson(json);
}
