// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  mobile: json['mobile'] as String?,
  email: json['email'] as String?,
  image: json['image'] as String,
  role: json['role'] as String,
  isNotifiable: UserModel._fromJson((json['is_notifiable'] as num?)?.toInt()),
  username: json['username'] as String,
  isPlus: UserModel._fromJson((json['is_plus'] as num?)?.toInt()),
  isFriend: json['is_friend'] as bool?,
  hasChallenge: json['has_challenge'] as bool?,
)..isFollowing = json['is_following'] as bool?;

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'is_plus': instance.isPlus,
  'is_notifiable': instance.isNotifiable,
  'is_friend': instance.isFriend,
  'is_following': instance.isFollowing,
  'has_challenge': instance.hasChallenge,
  'name': instance.name,
  'username': instance.username,
  'image': instance.image,
  'email': instance.email,
  "role": instance.role,
  'mobile': instance.mobile,
};
