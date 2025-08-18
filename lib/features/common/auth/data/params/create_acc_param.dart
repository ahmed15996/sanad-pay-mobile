import 'package:json_annotation/json_annotation.dart';

part 'create_acc_param.g.dart';

@JsonSerializable(createFactory: false)
class CreateAccParam {
  final String name,email,username,mobile,password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  @JsonKey(name: 'agreed_terms')
  final bool agreedTerms;


  CreateAccParam(
      {
        required this.name,
        required this.email,
        required this.username,
        required this.mobile,
        required this.password,
        required this.passwordConfirmation,
        required this.agreedTerms
});


  Map<String, dynamic> toJson() => _$CreateAccParamToJson(this);



}
