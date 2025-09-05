import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable(createToJson: false)
class CategoryModel  with CustomDropdownListFilter{
  final int id;
  final String image,name;

  CategoryModel({
    required this.id,
    required this.image,
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  @override
  bool filter(String query) {
    return name.toLowerCase().contains(query.toLowerCase());
  }

  @override
  String toString() {
    return name;
  }
}
