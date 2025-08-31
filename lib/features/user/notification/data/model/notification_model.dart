import 'package:json_annotation/json_annotation.dart';
import 'package:sanad/features/store/home/data/models/order_model.dart';

part 'notification_model.g.dart';

@JsonSerializable(createToJson: false, includeIfNull: true)
class NotificationModel {
  final String id , body;
  final OrderModel? order;

  NotificationModel({
    required this.id,
    this.order,
    required this.body,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
