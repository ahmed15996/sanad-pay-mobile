
import '../../model/notification_model.dart';

abstract class NotificationsRemoteDataSource {
  Future<List<NotificationModel>> fetchNotifications();

}
