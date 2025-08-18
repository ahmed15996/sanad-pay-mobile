part of 'pin_code_cubit.dart';

@immutable
abstract class PinCodeState {}

class PinCodeInitial extends PinCodeState {}

class PinCodeLoading extends PinCodeState {}

class ResendCodeLoading extends PinCodeState {}

class PinCodeFailure extends PinCodeState {}

class AuthUserFailure extends PinCodeState {}

class SaveDataFailure extends PinCodeState {}

class ChangeLangFailure extends PinCodeState {}

class PinCodeSuccess extends PinCodeState {}
