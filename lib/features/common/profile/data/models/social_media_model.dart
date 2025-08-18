import 'package:json_annotation/json_annotation.dart';

part 'social_media_model.g.dart';

@JsonSerializable(createToJson: false)
class SocialMediaModel {
  final String instagram, facebook, twitter, website, linkedin , android , ios;

  SocialMediaModel({
    required this.instagram,
    required this.facebook,
    required this.twitter,
    required this.website,
    required this.linkedin,
    required this.android,
    required this.ios,
  });

  factory SocialMediaModel.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaModelFromJson(json);
}
