import 'package:json_annotation/json_annotation.dart';

part 'transaction_history_params.g.dart';

@JsonSerializable(createFactory: false)
class TransactionHistoryParams {

  final int page;


  TransactionHistoryParams(
      {required this.page});

  Map<String, dynamic> toJson() => _$TransactionHistoryParamsToJson(this);
}
