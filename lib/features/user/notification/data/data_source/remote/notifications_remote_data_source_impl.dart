import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/base_response.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../model/notification_model.dart';
import 'notifications_remote_data_source.dart';

@Injectable(as: NotificationsRemoteDataSource)
class NotificationsRemoteDataSourceImpl extends NotificationsRemoteDataSource {
  final ApiConsumer apiConsumer;

  NotificationsRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<NotificationModel>> fetchNotifications() async {
    BaseResponse response = await apiConsumer.get(ApiConstants.notifications);
    if (response.status == true) {
      return response.data
          .map<NotificationModel>((json) => NotificationModel.fromJson(json))
          .toList();
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
