import 'package:json_annotation/json_annotation.dart';
import 'package:sanad/features/user/home/data/models/banner_model.dart';
import 'package:sanad/features/user/home/data/models/category_model.dart';
import 'package:sanad/features/user/home/data/models/store_model.dart';

import 'search_model.dart';

part 'nearby_model.g.dart';

@JsonSerializable(createToJson: false)
class NearbyModel {

  @JsonKey(name: 'selected_stores')
  final List<StoreModel> selectedStores;
  final SearchModel search;


  NearbyModel({
    required this.selectedStores,
    required this.search
  });

  factory NearbyModel.fromJson(Map<String, dynamic> json) =>
      _$NearbyModelFromJson(json);
}
