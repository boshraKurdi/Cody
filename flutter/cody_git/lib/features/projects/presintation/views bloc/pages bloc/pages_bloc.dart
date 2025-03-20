import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/pages/add_page_model.dart';
import '../../../data/models/pages/delate_page_model.dart';
import '../../../data/models/pages/get_all_code_for_page_model.dart';
import '../../../data/models/pages/show_page_model.dart';
import '../../../data/models/pages/update_page_model.dart';
import '../../../data/repo/pages_repo.dart';

part 'pages_event.dart';
part 'pages_state.dart';

class PagesBloc extends Bloc<PagesEvent, PagesState> {
  final PagesRepo projectsRepo;
  PagesBloc(this.projectsRepo) : super(PagesInitial()) {
    on<getAllCodeForPageEvent>((event, emit) async {
      emit(PagesLoading());
      var result = await  projectsRepo.getAllCodeForPage(PageId: event.PageId);
      result.fold((failure) => emit(PagesFailed(failure.errMassage)),
              (user) {
            emit(GetAllCodeFoePageSuccess(user));
          });
    });
    on<createPagesEvent>((event, emit) async {
      emit(PagesLoading());
      var result = await  projectsRepo.createPage(title: event.title, description: event.description, feature_id: event.feature_id, );
      result.fold((failure) => emit(PagesFailed(failure.errMassage)),
              (user) {
            emit(CreatePagesSuccess(user));
          });
    });
    on<updatePagesEvent>((event, emit) async {
      emit(PagesLoading());
      var result = await  projectsRepo.uodatePage(title: event.title, description: event.description, PageId: event.PageId, feature_id: event.Feautre_id,);
      result.fold((failure) => emit(PagesFailed(failure.errMassage)),
              (user) {
            emit(UpdatePagesSuccess(user));
          });
    });
    on<deleatePagesEvent>((event, emit) async {
      emit(PagesLoading());
      var result = await  projectsRepo.deleatePage(PageId: event.PageId);
      result.fold((failure) => emit(PagesFailed(failure.errMassage)),
              (user) {
            emit(DeleatePagesSuccess(user));
          });
    });
    on<showPagessEvent>((event, emit) async {
      emit(PagesLoading());
      var result = await  projectsRepo.showPages(PageId: event.PageId);
      result.fold((failure) => emit(PagesFailed(failure.errMassage)),
              (user) {
            emit(ShowPagesDetailesSuccess(user));
          });
    });
  }
}
