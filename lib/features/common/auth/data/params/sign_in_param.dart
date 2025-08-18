import 'package:json_annotation/json_annotation.dart';

part 'sign_in_param.g.dart';

@JsonSerializable(createFactory: false)
class SignInParam {
  final String identify,password,fcm;


  SignInParam(
      {required this.identify,
      required this.password,
      required this.fcm,
      });


  Map<String, dynamic> toJson() => _$SignInParamToJson(this);



}
