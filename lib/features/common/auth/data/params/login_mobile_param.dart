import 'package:json_annotation/json_annotation.dart';

part 'login_mobile_param.g.dart';

@JsonSerializable(createFactory: false)
class LoginMobileParam {
  final String mobile,code,fcm;


  LoginMobileParam(
      {required this.mobile,
      required this.code,
      required this.fcm,
      });


  Map<String, dynamic> toJson() => _$LoginMobileParamToJson(this);



}
