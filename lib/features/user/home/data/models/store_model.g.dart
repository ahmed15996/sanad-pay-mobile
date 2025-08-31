// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  address: json['address'] as String,
  logo: json['logo'] as String,
  lat: json['lat'] as String,
  long: json['long'] as String,
  description: json['description'] as String?,
  workingTime: json['working_time'] as String?,
  offers: (json['offers'] as List<dynamic>?)
      ?.map((e) => OfferModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);
