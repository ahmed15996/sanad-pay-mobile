import 'package:json_annotation/json_annotation.dart';

part 'offer_model.g.dart';

@JsonSerializable(createToJson: false, includeIfNull: true)
class OfferModel {
  final int id,discount;
  final String name, image, price,date;

  OfferModel({
    required this.id,
    required this.name,
    required this.image,
    required this.discount,
    required this.price,
    required this.date,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);
}
