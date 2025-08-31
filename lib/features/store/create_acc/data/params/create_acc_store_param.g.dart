// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_acc_store_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateAccStoreParamToJson(
  CreateAccStoreParam instance,
) => <String, dynamic>{
  'store_name': instance.storeName,
  'lat': instance.lat,
  'long': instance.long,
  'address': instance.address,
  'phone': instance.phone,
  'description': instance.description,
  'city_id': instance.cityId,
  'category_id': instance.categoryId,
  'owner_name': instance.ownerName,
  'branches_count': instance.branchesCount,
  'commercial_number': instance.commercialNumber,
  'work_from': instance.workFrom,
  'work_to': instance.workTo,
  'commercial_image': CreateAccStoreParam._multipartFileToJson(
    instance.commercialImage,
  ),
  'store_logo': CreateAccStoreParam._multipartFileToJson(instance.storeLogo),
  'fcm': instance.fcm,
};
