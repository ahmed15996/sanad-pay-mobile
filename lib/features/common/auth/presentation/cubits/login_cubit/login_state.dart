part of 'login_cubit.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}
class SignInLoading extends SignInState {}
class SignInFailure extends SignInState {}
class SignInSuccess extends SignInState {}

class ForgetPasswordLoading extends SignInState {}
class ForgetPasswordFailure extends SignInState {}
class ForgetPasswordSuccess extends SignInState {}
