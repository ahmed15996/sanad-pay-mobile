import 'package:bloc/bloc.dart';

import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../../data/repository/static_pages_repository.dart';
part 'about_app_state.dart';

@injectable
class AboutAppCubit extends Cubit<AboutAppState> {
  final StaticPagesRepository repository;

  AboutAppCubit(this.repository) : super(AboutAppInitial());

  String? whoAreData;

  void fetchWhoAreWe() async {
    emit(GetWhoAreLoading());
    var result = await repository.fetchWhoAre();
    result.fold(
      (failure) {
        emit(GetWhoAreFailure(error: failure.message));
      },
      (whoAreData) {
        this.whoAreData = whoAreData;
        emit(GetWhoAreSuccess());
      },
    );
  }
}
