import 'package:json_annotation/json_annotation.dart';

part 'search_params.g.dart';

@JsonSerializable(createFactory: false)
class SearchParams {
  final String key;
  final int page;

  SearchParams(
      {required this.key, required this.page});

  Map<String, dynamic> toJson() => _$SearchParamsToJson(this);
}
