import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../model/notification_model.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, List<NotificationModel>>> fetchNotifications();
}
