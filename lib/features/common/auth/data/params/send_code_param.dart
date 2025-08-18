import 'package:json_annotation/json_annotation.dart';

part 'send_code_param.g.dart';

@JsonSerializable(createFactory: false)
class SendCodeParam {
  final String mobile;

  SendCodeParam(
      {required this.mobile,});


  Map<String, dynamic> toJson() => _$SendCodeParamToJson(this);



}
