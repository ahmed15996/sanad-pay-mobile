import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/notification_model.dart';
import '../../data/repository/notifications_repository.dart';

part 'notifications_state.dart';

@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepository repository;

  NotificationsCubit(this.repository) : super(NotificationsInitial());

  List<NotificationModel> notifications = [];

  void fetchNotifications() async {
    emit(GetNotificationsLoading());
    var result = await repository.fetchNotifications();
    result.fold(
      (failure) {
        emit(GetNotificationsFailure(error: failure.message));
      },
      (notifications) {
        this.notifications = notifications;
        emit(GetNotificationsSuccess());
      },
    );
  }
}
