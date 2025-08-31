// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NearbyModel _$NearbyModelFromJson(Map<String, dynamic> json) => NearbyModel(
  selectedStores: (json['selected_stores'] as List<dynamic>)
      .map((e) => StoreModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  search: SearchModel.fromJson(json['search'] as Map<String, dynamic>),
);
