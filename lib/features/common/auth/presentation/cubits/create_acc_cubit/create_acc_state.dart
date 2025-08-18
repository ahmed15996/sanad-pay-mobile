part of 'create_acc_cubit.dart';

@immutable
abstract class CreateAccState {}

class CreateAccInitial extends CreateAccState {}


class CreateAccLoading extends CreateAccState {}
class CreateAccFailure extends CreateAccState {}
class CreateAccSuccess extends CreateAccState {}

class SaveDataFailure extends CreateAccState {}

