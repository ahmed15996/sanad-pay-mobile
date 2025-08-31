import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/routing/routes.dart';
import 'package:sanad/features/common/bottom_nav/data/arguments/bottom_nav_argument.dart';
import 'package:sanad/features/user/payments/data/models/payment_model.dart';
import '../../../../../../core/widgets/custom_toast.dart';
import '../../../data/models/upcoming_payments_model.dart';
import '../../../data/params/previous_payments_params.dart';
import '../../../data/repository/payments_repository.dart';
part 'payments_state.dart';

@injectable
class PaymentsCubit extends Cubit<PaymentsState> {
  final PaymentsRepository repository;

  PaymentsCubit(this.repository) : super(PaymentsInitial());

  List<PaymentModel> previousPayments = [];
  UpcomingPaymentsModel? upcomingPayments;
  int page = 1;

  final previousPaymentsRefreshController = RefreshController();

  void fetchUpcomingPayments() async {
    emit(GetUpcomingPaymentsLoading());
    var result = await repository.fetchUpcomingPayments();
    result.fold(
      (failure) {
        emit(GetUpcomingPaymentsFailure(error: failure.message));
      },
      (upcomingPayments) {
        this.upcomingPayments = upcomingPayments;
        emit(GetUpcomingPaymentsSuccess());
      },
    );
  }

  void pay() async {
    emit(PayLoading());
    var result = await repository.pay(upcomingPayments!.upcomingPayment!.id);
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(PayFailure());
      },
      (String message) {
        upcomingPayments!.hasPaidThisMonth = true;
        showToast(text: message, state: ToastStates.success);
        emit(PaySuccess());
      },
    );
  }

  void accept(int orderId,bool isFromNotification, BuildContext context) async {
    emit(AcceptLoading());
    var result = await repository.accept(orderId);
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(AcceptFailure());
      },
      (message) {
        showToast(text: message, state: ToastStates.success);
        if(isFromNotification){
          context.pop(arguments: true);
        }else{
          context.pushAndRemoveUntilWithNamed(
            Routes.bottomNavView,
            arguments: BottomNavArgument(isUser: true, index: 0),
          );
        }
        emit(AcceptSuccess());
      },
    );
  }

  void reject(int orderId,bool isFromNotification, BuildContext context) async {
    emit(RejectLoading());
    var result = await repository.reject(orderId);
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(RejectFailure());
      },
      (message) {
        showToast(text: message, state: ToastStates.success);
        if(isFromNotification){
          context.pop(arguments: true);
        }else{
        context.pushAndRemoveUntilWithNamed(
          Routes.bottomNavView,
          arguments: BottomNavArgument(isUser: true, index: 0),
        );
        }
        emit(RejectSuccess());
      },
    );
  }

  void fetchPreviousPayments() async {
    if (page != 1) {
      emit(GetPreviousPaymentsPaginationLoading());
      debugPrint("Pagination...............");
    } else {
      emit(GetPreviousPaymentsLoading());
    }
    var result = await repository.fetchPreviousPayments(
      PreviousPaymentsParams(page: page),
    );
    result.fold(
      (failure) {
        if (page != 1) {
          previousPaymentsRefreshController.loadFailed();
          emit(GetPreviousPaymentsPaginationFailure());
        } else {
          emit(GetPreviousPaymentsFailure(error: failure.message));
        }
      },
      (previousPaymentsModel) {
        if (page != 1) {
          if (previousPaymentsModel.previousPayments.isNotEmpty) {
            previousPayments.addAll(previousPaymentsModel.previousPayments);
            previousPaymentsRefreshController.loadComplete();
          } else {
            previousPaymentsRefreshController.loadNoData();
          }
        } else {
          previousPaymentsRefreshController.refreshCompleted();
          previousPaymentsRefreshController.loadComplete();
          previousPayments.clear();
          previousPayments.addAll(previousPaymentsModel.previousPayments);
        }
        emit(GetPreviousPaymentsSuccess());
      },
    );
  }

  void refreshPreviousPayments() {
    debugPrint("+++++++++++++++++++++++++++++++");
    page = 1;
    debugPrint("Refreshing..........");
    fetchPreviousPayments();
  }

  void paginatePreviousPayments() {
    debugPrint("+++++++++++++++++++++++++++++++");
    state is GetPreviousPaymentsPaginationFailure
        ? debugPrint("Not Add Item Count")
        : page++;
    debugPrint("Pagination..........");
    fetchPreviousPayments();
  }

  @override
  Future<void> close() {
    previousPaymentsRefreshController.dispose();
    return super.close();
  }
}
