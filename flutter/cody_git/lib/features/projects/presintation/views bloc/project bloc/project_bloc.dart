import 'package:bloc/bloc.dart';
import 'package:cody/features/projects/data/repo/project_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/models/projects/all_features_for_projects_model.dart';
import '../../../data/models/projects/create_project_model.dart';
import '../../../data/models/projects/deleate_project_model.dart';
import '../../../data/models/projects/show_all_projects.dart';
import '../../../data/models/projects/show_project_detailes_model.dart';
import '../../../data/models/projects/update_project_model.dart';
part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
   final ProjectsRepo projectsRepo;
  ProjectBloc(this.projectsRepo) : super(ProjectInitial()) {
    on<getAllProjects>((event, emit) async {
      emit(ProjectLoading());
      var result = await projectsRepo.getAllProjects();
      result.fold((failure) => emit(ProjectFailed(failure.errMassage)),
              (user) {
            emit(GetAllProjectSuccess(user));
          });
    });
    on<getAllFeaturesForProject>((event, emit) async {
      emit(ProjectLoading());
      var result = await projectsRepo.getAllFeaturesForProject(projectId: event.projectId);
      result.fold((failure) => emit(ProjectFailed(failure.errMassage)),
              (user) {
            emit(AllFeaturesForProjectSuccess(user));
          });
    });
    on<createProject>((event, emit) async {
      emit(ProjectLoading());
      var result = await projectsRepo.createProject(title: event.title, description: event.description, language: event.language);
      result.fold((failure) => emit(ProjectFailed(failure.errMassage)),
              (user) {
            emit(CreateProjectSuccess(user));
          });
    });
    on<updateProject>((event, emit) async {
      emit(ProjectLoading());
      var result = await projectsRepo.updateProject(projectId: event.projectId, title: event.title, description: event.description, language: event.language);
      result.fold((failure) => emit(ProjectFailed(failure.errMassage)),
              (user) {
            emit(UpdateProjectSuccess(user));
          });
    });
    on<showProjects>((event, emit) async {
      emit(ProjectLoading());
      var result = await projectsRepo.showProjects(projectId: event.projectId);
      result.fold((failure) => emit(ProjectFailed(failure.errMassage)),
              (user) {
            emit(ShowProjectDetailesSuccess(user));
          });
    });
    on<deleateProject>((event, emit) async {
      emit(ProjectLoading());
      var result = await projectsRepo.deleateProject(projectId: event.projectId);
      result.fold((failure) => emit(ProjectFailed(failure.errMassage)),
              (user) {
            emit(DeleateProjectSuccess(user));
          });
    });
  }
}
