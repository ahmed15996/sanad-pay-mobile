import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../data_source/remote/notifications_remote_data_source.dart';
import '../model/notification_model.dart';
import 'notifications_repository.dart';

@Injectable(as: NotificationsRepository)
class NotificationsRepositoryImpl extends NotificationsRepository {
  final NotificationsRemoteDataSource notificationsRemoteDataSource;

  NotificationsRepositoryImpl({required this.notificationsRemoteDataSource});

  @override
  Future<Either<Failure, List<NotificationModel>>> fetchNotifications() async {
    try {
      List<NotificationModel> notifications =
          await notificationsRemoteDataSource.fetchNotifications();
      return Right(notifications);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }
}
