import 'package:json_annotation/json_annotation.dart';

part 'create_acc_user_param.g.dart';

@JsonSerializable(createFactory: false)
class CreateAccUserParam {
  final String name,email,phone;
  final String fcm;
  @JsonKey(name: 'city_id')
  final int cityId;

  CreateAccUserParam(
      {required this.name,
      required this.email,
      required this.phone,
      required this.fcm,
      required this.cityId});

  Map<String, dynamic> toJson() => _$CreateAccUserParamToJson(this);
}
