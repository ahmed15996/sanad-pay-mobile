import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import '../../../home/data/models/store_model.dart';
import '../../data/repository/store_details_repository.dart';
part 'store_details_state.dart';

@injectable
class StoreDetailsCubit extends Cubit<StoreDetailsState> {
  final StoreDetailsRepository repository;

  StoreDetailsCubit(
    this.repository,

  ) : super(StoreDetailsInitial());

  StoreModel? storeModel;


  void fetchStoreDetails(int storeId) async {
    emit(GetStoreDetailsLoading());
    var result = await repository.fetchStoreDetails(storeId);
    result.fold(
      (failure) {
        emit(GetStoreDetailsFailure(error: failure.message));
      },
      (storeModel) {
        this.storeModel = storeModel;
          emit(GetStoreDetailsSuccess());

      },
    );
  }



}
