import 'package:json_annotation/json_annotation.dart';
import 'user_model.dart';

part 'verify_code_model.g.dart';


@JsonSerializable(createToJson: true,includeIfNull: true)
class VerifyCodeModel {
  final String? token,action;
  @JsonKey(name: "user")
  final UserModel? user;



  VerifyCodeModel({
     this.token,
     this.action,
     this.user,
  });

  factory VerifyCodeModel.fromJson(Map<String, dynamic> json) => _$VerifyCodeModelFromJson(json);
}
