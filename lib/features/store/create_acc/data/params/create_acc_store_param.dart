import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_acc_store_param.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: true)
class CreateAccStoreParam {
  @JsonKey(name: 'store_name')
  final String storeName;
  final double lat,long;
  final String address,phone,description;
  @JsonKey(name: 'city_id')
  final int cityId;
  @JsonKey(name: 'category_id')
  final int categoryId;
  @JsonKey(name: 'owner_name')
  final String ownerName;
  @JsonKey(name: 'branches_count')
  final String branchesCount;
  @JsonKey(name: 'commercial_number')
  final String commercialNumber;
  @JsonKey(name: 'work_from')
  final String workFrom;
  @JsonKey(name: 'work_to')
  final String workTo;
  @JsonKey(name: 'commercial_image', toJson: _multipartFileToJson)
  final MultipartFile commercialImage;
  @JsonKey(name: 'store_logo', toJson: _multipartFileToJson)
  final MultipartFile storeLogo;
  final String fcm;

  CreateAccStoreParam({
    required this.storeName,
    required this.lat,
    required this.long,
    required this.address,
    required this.phone,
    required this.cityId,
    required this.categoryId,
    required this.ownerName,
    required this.branchesCount,
    required this.commercialNumber,
    required this.commercialImage,
    required this.storeLogo,
    required this.fcm,
    required this.description,
    required this.workFrom,
    required this.workTo,
});

  Map<String, dynamic> toJson() => _$CreateAccStoreParamToJson(this);

  static MultipartFile? _multipartFileToJson(MultipartFile? file) {
    return file;
  }
}
