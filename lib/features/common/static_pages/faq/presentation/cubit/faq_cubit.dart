import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/question_model.dart';
import '../../../data/repository/static_pages_repository.dart';
part 'faq_state.dart';

@injectable
class FaqCubit extends Cubit<FaqState> {
  final StaticPagesRepository repository;

  FaqCubit(this.repository) : super(FaqInitial());

  List<QuestionModel> questions = [];

  void fetchFaqs() async {
    emit(GetFaqLoading());
    var result = await repository.fetchQuestions();
    result.fold(
      (failure) {
        emit(GetFaqFailure(error: failure.message));
      },
      (questions) {
        this.questions = questions;
        emit(GetFaqSuccess());
      },
    );
  }
}
