part of 'project_bloc.dart';

@immutable
sealed class ProjectState {}

final class ProjectInitial extends ProjectState {}
class ProjectLoading extends ProjectState {}
class GetAllProjectSuccess extends ProjectState {
  final  ShowAllProjectModel showAllProjectModel;
  GetAllProjectSuccess(this.showAllProjectModel);
}
class AllFeaturesForProjectSuccess extends ProjectState {
  final  AllFeaturesForProjectModel showAllProjectModel;
  AllFeaturesForProjectSuccess(this.showAllProjectModel);

}
class CreateProjectSuccess extends ProjectState {
  final  CreateProjectModel showAllProjectModel;
  CreateProjectSuccess(this.showAllProjectModel);
}
class UpdateProjectSuccess extends ProjectState {
  final  UpdateProjectModel showAllProjectModel;
  UpdateProjectSuccess(this.showAllProjectModel);
}
class ShowProjectDetailesSuccess extends ProjectState {
  final  ShowProjectDetailesModel showAllProjectModel;
  ShowProjectDetailesSuccess(this.showAllProjectModel);
}
class DeleateProjectSuccess extends ProjectState {
  final  DeleateProjectModel showAllProjectModel;
  DeleateProjectSuccess(this.showAllProjectModel);
}
class ProjectFailed extends ProjectState {
  final String error;
  ProjectFailed(this.error);
}
