import 'package:bloc/bloc.dart';
import 'package:cody/features/projects/data/repo/code_repo_impl.dart';
import 'package:meta/meta.dart';

import '../../../data/models/code/add_code_to_a_new_project_model.dart';
import '../../../data/models/code/add_code_to_an_exested_page_model.dart';
import '../../../data/models/code/add_code_to_an_new_page_with_an_existed_feature_model.dart';
import '../../../data/models/code/add_code_to_an_newpage_and_new_feature_model.dart';
import '../../../data/models/code/show_code_model.dart';
import '../../../data/repo/code_repo.dart';

part 'code_event.dart';
part 'code_state.dart';

class CodeBloc extends Bloc<CodeEvent, CodeState> {
  final CodesRepo projectsRepo;
  CodeBloc(this.projectsRepo) : super(CodeInitial()) {
    on<addCodeToaNewProjectEvent>((event, emit) async {
      emit(CodeLoading());
      var result = await projectsRepo.addCodeToaNewProject(project_title: event.project_title, project_description:  event.project_description, language:  event.language, feature_title:  event.feature_title, page_title:  event.page_title, code_title:  event.code_title, code_description:  event.code_description, code_content:  event.code_content);
      result.fold((failure) => emit(CodeFailed(failure.errMassage)),
              (user) {
            emit(addCodeToaNewProjectSuccess(user));
          });
    });
    on<addCodeToAnExistingPageEvent>((event, emit) async {
      emit(CodeLoading());
      var result = await projectsRepo.addCodeToAnExistingPage(title: event.title, code: event.code, description: event.description, page_id: event.page_id);
      result.fold((failure) => emit(CodeFailed(failure.errMassage)),
              (user) {
            emit(addCodeToAnExistingPageSuccess(user));
          });
    });
    on<addCodeToAnNewPageWithAnExectingFeatureEvent>((event, emit) async {
      emit(CodeLoading());
      var result = await projectsRepo.addCodeToAnNewPageWithAnExectingFeature(page_title: event.page_title, code_title:  event.code_title, code_description:  event.code_description, page_description:  event.page_description, code_content:  event.code_content, FeatuerId:  event.FeatuerId, ProjectId:  event.ProjectId);
      result.fold((failure) => emit(CodeFailed(failure.errMassage)),
              (user) {
            emit(addCodeToAnNewPageWithAnExectingFeature(user));
          });
    });
    on<addCodeToAnNewPageWithAnNewFeature>((event, emit) async {
      emit(CodeLoading());
      var result = await projectsRepo.addCodeToAnNewPageWithAnNewFeature(feature_title: event.feature_title, page_title: event.page_title, code_title: event.code_title, code_description: event.code_description, code_content: event.code_content, page_description: event.page_description, feature_description: event.feature_description, projectId: event.projectId)  ;
      result.fold((failure) => emit(CodeFailed(failure.errMassage)),
              (user) {
            emit(addCodeToAnNewPageWithAnNewFeatureSuccess(user));
          });
    });
  }
}
