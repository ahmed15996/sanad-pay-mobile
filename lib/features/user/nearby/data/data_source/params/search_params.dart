import 'package:json_annotation/json_annotation.dart';

part 'search_params.g.dart';

@JsonSerializable(createFactory: false)
class SearchParams {
  final String key;
  final int page;
  final double? lat,long;

  SearchParams(
      {required this.key, required this.page,required this.lat,required this.long});

  Map<String, dynamic> toJson() => _$SearchParamsToJson(this);
}
