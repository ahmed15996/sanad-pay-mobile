import 'package:json_annotation/json_annotation.dart';

part 'home_user_params.g.dart';

@JsonSerializable(createFactory: false)
class HomeUserParams {

  final double lat,long;


  HomeUserParams(
      {required this.lat,required this.long});

  Map<String, dynamic> toJson() => _$HomeUserParamsToJson(this);
}
