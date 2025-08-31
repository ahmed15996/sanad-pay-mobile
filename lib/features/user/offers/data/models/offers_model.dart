import 'package:json_annotation/json_annotation.dart';
import 'package:sanad/features/user/offers/data/models/offer_model.dart';

part 'offers_model.g.dart';

@JsonSerializable(createToJson: false)
class OffersModel {
  @JsonKey(name: 'data')
  final List<OfferModel> offersModel;

  OffersModel({
    required this.offersModel,
  });

  factory OffersModel.fromJson(Map<String, dynamic> json) =>
      _$OffersModelFromJson(json);
}
