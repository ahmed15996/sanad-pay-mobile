import 'package:json_annotation/json_annotation.dart';

part 'offers_params.g.dart';

@JsonSerializable(createFactory: false)
class OffersParams {
  final int page;


  OffersParams(
      {required this.page});

  Map<String, dynamic> toJson() => _$OffersParamsToJson(this);
}
