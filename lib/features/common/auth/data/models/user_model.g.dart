// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  nationalIdVerified: UserModel._fromJson(
    (json['national_id_verified'] as num).toInt(),
  ),
  phone: json['phone'] as String,
  image: json['image'] as String,
  type: json['type'] as String,
  balance: (json['balance'] as num).toInt(),
  email: json['email'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'balance': instance.balance,
  'national_id_verified': instance.nationalIdVerified,
  'name': instance.name,
  'phone': instance.phone,
  'image': instance.image,
  'type': instance.type,
  'email': instance.email,
};
