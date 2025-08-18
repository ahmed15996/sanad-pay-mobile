import 'package:json_annotation/json_annotation.dart';

part 'check_otp_param.g.dart';


@JsonSerializable(createFactory: false)
class CheckOtpParam {
  final String mobile, code;

  CheckOtpParam({required this.mobile, required this.code});

  Map<String, dynamic> toJson() => _$CheckOtpParamToJson(this);


}
