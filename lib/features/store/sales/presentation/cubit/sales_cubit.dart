import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sanad/features/store/home/data/models/order_model.dart';
import 'package:sanad/features/store/home/data/repository/home_store_repository.dart';
import 'package:sanad/features/store/sales/data/models/sales_model.dart';
import 'package:sanad/features/store/sales/data/params/orders_params.dart';
import 'package:sanad/features/user/payments/data/models/payment_model.dart';
import 'package:sanad/features/user/payments/data/models/transaction_model.dart';

import '../../../../common/auth/data/models/user_model.dart';
import '../../../../user/home/data/repository/home_user_repository.dart';
import '../../../home/data/models/dashboard_model.dart';
import '../../data/repository/sales_repository.dart';
part 'sales_state.dart';

@injectable
class SalesCubit extends Cubit<SalesState> {
  final SalesRepository repository;
  final HomeStoreRepository homeStoreRepository;
  final HomeUserRepository homeUserRepository;

  SalesCubit(this.repository, this.homeStoreRepository, this.homeUserRepository)
    : super(SalesInitial());

  List<OrderModel> orders = [];
  int page = 1;

  final ordersRefreshController = RefreshController();

  DashboardModel? dashboardModel;
  UserModel? userModel;
  SalesModel? ordersModel;

  void fetchDashboard() async {
    emit(GetSalesDataLoading());
    var result = await homeStoreRepository.fetchDashboard();
    result.fold(
      (failure) {
        emit(GetSalesDataFailure(error: failure.message));
      },
      (dashboardModel) {
        this.dashboardModel = dashboardModel;
        fetchUserProfile();
      },
    );
  }

  void fetchUserProfile() async {
    emit(GetSalesDataLoading());
    var result = await homeUserRepository.fetchUserProfile();
    result.fold(
      (failure) {
        emit(GetSalesDataFailure(error: failure.message));
      },
      (userModel) {
        this.userModel = userModel;
        fetchSales();
      },
    );
  }

  void fetchSales() async {
    if (page != 1) {
      emit(GetSalesPaginationLoading());
      debugPrint("Pagination...............");
    } else {
      emit(GetSalesDataLoading());
    }
    var result = await repository.fetchSales(OrdersParams(page: page));
    result.fold(
      (failure) {
        if (page != 1) {
          ordersRefreshController.loadFailed();
          emit(GetSalesPaginationFailure());
        } else {
          emit(GetSalesDataFailure(error: failure.message));
        }
      },
      (salesModel) {
        if (page != 1) {
          if (salesModel.orders.orders.isNotEmpty) {
            ordersModel = salesModel;
            orders.addAll(salesModel.orders.orders);
            ordersRefreshController.loadComplete();
          } else {
            ordersRefreshController.loadNoData();
          }
        } else {
          ordersModel = salesModel;
          ordersRefreshController.refreshCompleted();
          ordersRefreshController.loadComplete();
          orders.clear();
          orders.addAll(salesModel.orders.orders);
        }
        emit(GetSalesDataSuccess());
      },
    );
  }

  void refreshSales() {
    debugPrint("+++++++++++++++++++++++++++++++");
    page = 1;
    debugPrint("Refreshing..........");
    fetchSales();
  }

  void paginateSales() {
    debugPrint("+++++++++++++++++++++++++++++++");
    state is GetSalesPaginationFailure
        ? debugPrint("Not Add Item Count")
        : page++;
    debugPrint("Pagination..........");
    fetchSales();
  }

  @override
  Future<void> close() {
    ordersRefreshController.dispose();
    return super.close();
  }
}
