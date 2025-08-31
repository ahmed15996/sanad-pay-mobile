// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
  selectedStores: (json['selected_stores'] as List<dynamic>)
      .map((e) => StoreModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  categories: (json['categories'] as List<dynamic>)
      .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  banners: (json['banners'] as List<dynamic>)
      .map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  nearbyStores: (json['nearby_stores'] as List<dynamic>)
      .map((e) => StoreModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);
