import 'package:json_annotation/json_annotation.dart';

part 'create_acc_param.g.dart';

@JsonSerializable(createFactory: false)
class CreateAccParam {
  final String name,phone,email,fcm;
  @JsonKey(name: 'city_id')
  final int cityId;


  CreateAccParam(
      {
        required this.name,
        required this.email,
        required this.phone,
        required this.cityId,
        required this.fcm
});


  Map<String, dynamic> toJson() => _$CreateAccParamToJson(this);



}
