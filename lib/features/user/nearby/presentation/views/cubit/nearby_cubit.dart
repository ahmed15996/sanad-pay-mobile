import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sanad/features/user/nearby/data/data_source/params/search_params.dart';

import '../../../../../../core/widgets/custom_toast.dart';
import '../../../../home/data/models/store_model.dart';
import '../../../data/repository/nearby_repository.dart';



part 'nearby_state.dart';

@injectable
class NearbyCubit extends Cubit<NearbyState> {
  final NearbyRepository repository;

  NearbyCubit(this.repository,) : super(NearbyInitial());

  List<StoreModel> stores = [];
  List<StoreModel> selectedStores = [];
  int page = 1;


  final refreshController = RefreshController();

  TextEditingController searchController = TextEditingController();

  initSearchController(String? key) {
    searchController.text = key ?? "";
    emit(GetNearbySuccess());
    fetchNearby();
  }

  void fetchNearby() async {
    if (page != 1) {
      emit(GetNearbyPaginationLoading());
      debugPrint("Pagination...............");
    } else {
      emit(GetNearbyLoading());
    }
    var result = await repository.fetchSearch(SearchParams(page: page,key: searchController.text ));
    result.fold(
      (failure) {
        if (page != 1) {
          refreshController.loadFailed();
          showToast(text: failure.message, state: ToastStates.error);
          emit(GetNearbyPaginationFailure());
        } else {
          emit(GetNearbyFailure(error: failure.message));
        }
      },
      (nearbyModel) {
        if (page != 1) {
          if (nearbyModel.search.stores.isNotEmpty) {
            stores.addAll(nearbyModel.search.stores);
            refreshController.loadComplete();
          } else {
            refreshController.loadNoData();
          }
        } else {
          refreshController.refreshCompleted();
          refreshController.loadComplete();
          stores.clear();
          selectedStores.clear();
          stores.addAll(nearbyModel.search.stores);
          selectedStores = nearbyModel.selectedStores;
        }
        emit(GetNearbySuccess());
      },
    );
  }

  void refreshNearby() {
    debugPrint("+++++++++++++++++++++++++++++++");
    page = 1;
    debugPrint("Refreshing..........");
    fetchNearby();
  }

  void paginateNearby() {
    debugPrint("+++++++++++++++++++++++++++++++");
    state is GetNearbyPaginationFailure
        ? debugPrint("Not Add Item Count")
        : page++;
    debugPrint("Pagination..........");
    fetchNearby();
  }


  @override
  Future<void> close() {
    refreshController.dispose();
    searchController.dispose();
    return super.close();
  }
}
