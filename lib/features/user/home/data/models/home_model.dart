import 'package:json_annotation/json_annotation.dart';
import 'package:sanad/features/user/home/data/models/banner_model.dart';
import 'package:sanad/features/user/home/data/models/category_model.dart';
import 'package:sanad/features/user/home/data/models/store_model.dart';

part 'home_model.g.dart';

@JsonSerializable(createToJson: false)
class HomeModel {

  @JsonKey(name: 'selected_stores')
  final List<StoreModel> selectedStores;
  final List<CategoryModel> categories;
  final List<BannerModel> banners;
  @JsonKey(name: 'nearby_stores')
  final List<StoreModel> nearbyStores;

  HomeModel({
    required this.selectedStores,
    required this.categories,
    required this.banners,
    required this.nearbyStores
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
}
