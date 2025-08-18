import 'package:json_annotation/json_annotation.dart';

part 'reset_password_param.g.dart';


@JsonSerializable(createFactory: false)
class ResetPasswordParam {
  final String mobile,password;
  @JsonKey(name: "password_confirmation")
  final String passwordConfirmation;

  ResetPasswordParam({required this.mobile,required this.password,required this.passwordConfirmation});

  Map<String, dynamic> toJson() => _$ResetPasswordParamToJson(this);


}
