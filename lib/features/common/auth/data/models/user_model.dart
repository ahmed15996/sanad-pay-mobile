import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable(includeIfNull: true)
class UserModel {
  final int id;
  @JsonKey(name: 'is_plus', fromJson: _fromJson)
  bool? isPlus;
  @JsonKey(name: 'is_notifiable', fromJson: _fromJson)
  bool? isNotifiable;
  @JsonKey(name: 'is_friend')
  bool? isFriend;
  @JsonKey(name: 'is_following')
  bool? isFollowing;
  @JsonKey(name: 'has_challenge')
  bool? hasChallenge;

  final String name, username, image,role;
  final String? email, mobile;

  UserModel({
    required this.id,
    required this.name,
    required this.role,
    this.mobile,
    this.email,
    required this.image,
    this.isNotifiable,
    required this.username,
    this.isPlus,
    this.isFriend,
    this.hasChallenge,
  });

  static bool? _fromJson(int? value) => value == 1;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
