// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
  stores: (json['data'] as List<dynamic>)
      .map((e) => StoreModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);
