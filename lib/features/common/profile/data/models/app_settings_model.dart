import 'package:json_annotation/json_annotation.dart';

part 'app_settings_model.g.dart';

@JsonSerializable(createToJson: false)
class AppSettingsModel {
  final String phone;
  @JsonKey(name: 'android_url')
  final String androidUrl;
  @JsonKey(name: 'ios_url')
  final String iosUrl;

  AppSettingsModel({
    required this.phone,
    required this.androidUrl,
    required this.iosUrl,
  });

  factory AppSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsModelFromJson(json);
}
