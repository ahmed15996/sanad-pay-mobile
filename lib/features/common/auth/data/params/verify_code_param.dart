import 'package:json_annotation/json_annotation.dart';

part 'verify_code_param.g.dart';


@JsonSerializable(createFactory: false)
class VerifyCodeParam {
  final String phone, code , fcm;

  VerifyCodeParam({required this.phone, required this.code, required this.fcm});

  Map<String, dynamic> toJson() => _$VerifyCodeParamToJson(this);


}
