import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:sanad/features/user/home/data/models/store_model.dart';

part 'search_model.g.dart';

@JsonSerializable(createToJson: false)
  class SearchModel {
  @JsonKey(name: 'data')
  final List<StoreModel> stores;

  SearchModel({
   required this.stores
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);
}
