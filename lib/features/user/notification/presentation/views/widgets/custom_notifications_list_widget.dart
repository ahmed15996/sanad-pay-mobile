import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/features/user/notification/data/model/notification_model.dart';
import 'package:sanad/features/user/notification/presentation/views/widgets/custom_notification_item_widget.dart';
import '../../../../../../core/framework/spaces.dart';

class CustomNotificationsListWidget extends StatelessWidget {
  final List<NotificationModel> notifications;
  const CustomNotificationsListWidget({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      padding: EdgeInsets.all(24.w),
      itemBuilder: (context, index) {
        return CustomNotificationItemWidget(notificationModel: notifications[index]);
      },
      itemCount: notifications.length,
      separatorBuilder: (context, index) {
        return heightSpace(32.h);
      },
    );
  }
}
