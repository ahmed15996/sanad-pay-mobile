import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable(includeIfNull: true)
class UserModel {
  final int id,balance;
  @JsonKey(name: "national_id_verified",fromJson: _fromJson)
  bool nationalIdVerified;
  final String name, phone, image,type;
  final String? email;

  UserModel({
    required this.id,
    required this.name,
    required this.nationalIdVerified,
    required this.phone,
    required this.image,
    required this.type,
    required this.balance,
    this.email,
  });

  static bool _fromJson(int value) => value == 1;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
