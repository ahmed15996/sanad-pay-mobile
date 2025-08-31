import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sanad/features/user/offers/data/models/offer_model.dart';
import 'package:sanad/features/user/offers/data/params/offers_params.dart';

import '../../../../../core/widgets/custom_toast.dart';
import '../../data/repository/offers_repository.dart';


part 'offers_state.dart';

@injectable
class OffersCubit extends Cubit<OffersState> {
  final OffersRepository repository;

  OffersCubit(this.repository,) : super(OffersInitial());

  List<OfferModel> offers = [];
  int page = 1;


  final refreshController = RefreshController();

  void fetchOffers() async {
    if (page != 1) {
      emit(GetOffersPaginationLoading());
      debugPrint("Pagination...............");
    } else {
      emit(GetOffersLoading());
    }
    var result = await repository.fetchOffers(OffersParams(page: page));
    result.fold(
      (failure) {
        if (page != 1) {
          refreshController.loadFailed();
          showToast(text: failure.message, state: ToastStates.error);
          emit(GetOffersPaginationFailure());
        } else {
          emit(GetOffersFailure(error: failure.message));
        }
      },
      (offersModel) {
        if (page != 1) {
          if (offersModel.offersModel.isNotEmpty) {
            offers.addAll(offersModel.offersModel);
            refreshController.loadComplete();
          } else {
            refreshController.loadNoData();
          }
        } else {
          refreshController.refreshCompleted();
          refreshController.loadComplete();
          offers.clear();
          offers.addAll(offersModel.offersModel);
        }
        emit(GetOffersSuccess());
      },
    );
  }

  void refreshOffers() {
    debugPrint("+++++++++++++++++++++++++++++++");
    page = 1;
    debugPrint("Refreshing..........");
    fetchOffers();
  }

  void paginateOffers() {
    debugPrint("+++++++++++++++++++++++++++++++");
    state is GetOffersPaginationFailure
        ? debugPrint("Not Add Item Count")
        : page++;
    debugPrint("Pagination..........");
    fetchOffers();
  }


  @override
  Future<void> close() {
    refreshController.dispose();
    return super.close();
  }
}
