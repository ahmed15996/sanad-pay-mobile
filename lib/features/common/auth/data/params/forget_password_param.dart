import 'package:json_annotation/json_annotation.dart';

part 'forget_password_param.g.dart';


@JsonSerializable(createFactory: false)
class ForgetPasswordParam {
  final String mobile;

  ForgetPasswordParam({required this.mobile});

  Map<String, dynamic> toJson() => _$ForgetPasswordParamToJson(this);


}
