import 'package:json_annotation/json_annotation.dart';

part 'invite_user_params.g.dart';

@JsonSerializable(createFactory: false)
class InviteUserParams {
  @JsonKey(name: 'invite_code')
  final String inviteCode;


  InviteUserParams(
      {required this.inviteCode});

  Map<String, dynamic> toJson() => _$InviteUserParamsToJson(this);
}
