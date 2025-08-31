// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffersModel _$OffersModelFromJson(Map<String, dynamic> json) => OffersModel(
  offersModel: (json['data'] as List<dynamic>)
      .map((e) => OfferModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);
