import 'package:json_annotation/json_annotation.dart';

part 'contact_us_param.g.dart';

@JsonSerializable(createFactory: false)
class ContactUsParam {
  final String name, email, message,subject;

  ContactUsParam({
    required this.name,
    required this.email,
    required this.message,
    required this.subject,
  });

  Map<String, dynamic> toJson() => _$ContactUsParamToJson(this);
}
