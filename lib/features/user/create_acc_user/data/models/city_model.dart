import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel with CustomDropdownListFilter {
  final int id;
  final String name;

  CityModel({required this.id, required this.name});

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  @override
  bool filter(String query) {
    return name.toLowerCase().contains(query.toLowerCase());
  }

  @override
  String toString() {
    return name;
  }


}
