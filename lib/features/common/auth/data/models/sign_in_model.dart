import 'package:json_annotation/json_annotation.dart';
import 'user_model.dart';

part 'sign_in_model.g.dart';


@JsonSerializable(createToJson: true,includeIfNull: true)
class SignInModel {
  final String? token;
  @JsonKey(name: "user")
  final UserModel user;



  SignInModel({
    required this.token,
    required this.user,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => _$SignInModelFromJson(json);
}
