import 'package:json_annotation/json_annotation.dart';

part 'previous_payments_params.g.dart';

@JsonSerializable(createFactory: false)
class PreviousPaymentsParams {

  final int page;


  PreviousPaymentsParams(
      {required this.page});

  Map<String, dynamic> toJson() => _$PreviousPaymentsParamsToJson(this);
}
