import 'package:bloc/bloc.dart';

import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../../data/repository/static_pages_repository.dart';
part 'privacy_state.dart';

@injectable
class PrivacyCubit extends Cubit<PrivacyState> {
  final StaticPagesRepository repository;

  PrivacyCubit(this.repository) : super(PrivacyInitial());
  String? privacyData;

  void fetchPrivacy() async {
    emit(GetPrivacyLoading());
    var result = await repository.fetchPrivacy();
    result.fold(
      (failure) {
        emit(GetPrivacyFailure(error: failure.message));
      },
      (privacyData) {
        this.privacyData = privacyData;
        emit(GetPrivacySuccess());
      },
    );
  }
}
