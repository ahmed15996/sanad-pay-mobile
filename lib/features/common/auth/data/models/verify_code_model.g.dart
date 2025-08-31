// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCodeModel _$VerifyCodeModelFromJson(Map<String, dynamic> json) =>
    VerifyCodeModel(
      token: json['token'] as String?,
      action: json['action'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyCodeModelToJson(VerifyCodeModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'action': instance.action,
      'user': instance.user,
    };
