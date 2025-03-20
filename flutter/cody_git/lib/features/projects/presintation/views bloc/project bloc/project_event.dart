part of 'project_bloc.dart';

@immutable
sealed class ProjectEvent {}
class getAllProjects extends ProjectEvent{
  getAllProjects();
}
class getAllFeaturesForProject extends ProjectEvent{
final  int projectId;
  getAllFeaturesForProject(this.projectId);
}
class createProject extends ProjectEvent{
  final String title;
  final String description;
  final String language;
  createProject(this.title, this.description, this.language);
}
class updateProject extends ProjectEvent{
  final int projectId;
  final String title;
  final String description;
  final String language;
  updateProject(this.projectId, this.title, this.description, this.language);
}
class showProjects extends ProjectEvent{
  final int projectId;
  showProjects(this.projectId);
}
class deleateProject extends ProjectEvent{
  final int projectId;
  deleateProject(this.projectId);
}

