part of 'favorait_project_bloc.dart';

@immutable
sealed class FavoraitProjectEvent {}
class getFavoraitProject extends FavoraitProjectEvent {

}
class SetFavoraitProject extends FavoraitProjectEvent {
  final int projectId;
  SetFavoraitProject(this.projectId);
}
