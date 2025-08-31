part of 'notifications_cubit.dart';

abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class GetNotificationsLoading extends NotificationsState {}

class GetNotificationsSuccess extends NotificationsState {}

class GetNotificationsFailure extends NotificationsState {
  final String error;

  GetNotificationsFailure({required this.error});
}
