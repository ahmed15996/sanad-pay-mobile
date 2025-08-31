import 'package:json_annotation/json_annotation.dart';
import 'package:sanad/features/user/home/data/models/store_model.dart';

part 'transaction_model.g.dart';

@JsonSerializable(createToJson: false)
class TransactionModel {
  final int id;
  final String amount,date;
  final StoreModel store;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.date,
    required this.store
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}
