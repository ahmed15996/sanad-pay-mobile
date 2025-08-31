import 'package:json_annotation/json_annotation.dart';

part 'send_code_param.g.dart';

@JsonSerializable(createFactory: false)
class SendCodeParam {
  final String phone;

  SendCodeParam(
      {required this.phone,});


  Map<String, dynamic> toJson() => _$SendCodeParamToJson(this);



}
