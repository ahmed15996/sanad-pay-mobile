import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import '../../../data/repository/static_pages_repository.dart';

part 'terms_and_cond_state.dart';

@injectable
class TermsAndCondCubit extends Cubit<TermsAndCondState> {
  final StaticPagesRepository repository;

  TermsAndCondCubit(this.repository) : super(TermsAndCondInitial());

  String? termsData;

  void fetchTerms() async {
    emit(GetTermsLoading());
    var result = await repository.fetchTerms();
    result.fold(
      (failure) {
        emit(GetTermsFailure(error: failure.message));
      },
      (termsData) {
        this.termsData = termsData;
        emit(GetTermsSuccess());
      },
    );
  }
}
