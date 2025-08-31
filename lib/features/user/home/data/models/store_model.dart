import 'package:json_annotation/json_annotation.dart';

import '../../../offers/data/models/offer_model.dart';

part 'store_model.g.dart';

@JsonSerializable(createToJson: false)
class StoreModel {
  final int id;
  final String name, address,logo,lat,long;
  final String? description;
  @JsonKey(name: 'working_time')
  final String? workingTime;
  final List<OfferModel>? offers;


  StoreModel({
    required this.id,
    required this.name,
    required this.address,
    required this.logo,
    required this.lat,
    required this.long,
    this.description,
    this.workingTime,
    this.offers
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
}
