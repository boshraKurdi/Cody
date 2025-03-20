part of 'favorait_project_bloc.dart';

@immutable
sealed class FavoraitProjectState {}

final class FavoraitProjectInitial extends FavoraitProjectState {}
class FeavoraitProjectLoading extends FavoraitProjectState {}
class FavoraitProjectSuccess extends FavoraitProjectState {
  final GetFavoraitProjectModel getFavoraitProjectModel;
  FavoraitProjectSuccess(this.getFavoraitProjectModel);
}
class SetFavoraitProjectSuccess extends FavoraitProjectState {
  final SetFavoraitProjectModel setFavoraitProjectModel;
  SetFavoraitProjectSuccess(this.setFavoraitProjectModel);
}
class FavoraitProjectFailed extends FavoraitProjectState {
  final String error;
  FavoraitProjectFailed(this.error);
}