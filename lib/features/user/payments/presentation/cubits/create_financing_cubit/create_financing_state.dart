part of 'create_financing_cubit.dart';

abstract class CreateFinancingState {}

class CreateFinancingInitial extends CreateFinancingState {}


class SendFinancingRequestLoading extends CreateFinancingState {}

class SendFinancingRequestFailure extends CreateFinancingState {}

class SendFinancingRequestSuccess extends CreateFinancingState {}

class SelectDateState extends CreateFinancingState {}

