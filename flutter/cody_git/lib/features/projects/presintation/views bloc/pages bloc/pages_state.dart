part of 'pages_bloc.dart';

@immutable
sealed class PagesState {}

final class PagesInitial extends PagesState {}
class PagesLoading extends PagesState {}
class GetAllCodeFoePageSuccess extends PagesState {
  final  GetAllCodeFoePageModel showAllPagesModel;
  GetAllCodeFoePageSuccess(this.showAllPagesModel);
}
class CreatePagesSuccess extends PagesState {
  final  AddPageModel showAllPagesModel;
  CreatePagesSuccess(this.showAllPagesModel);
}
class UpdatePagesSuccess extends PagesState {
  final  UpdatePageModel showAllPagesModel;
  UpdatePagesSuccess(this.showAllPagesModel);
}
class ShowPagesDetailesSuccess extends PagesState {
  final  ShowPageModel showAllPagesModel;
  ShowPagesDetailesSuccess(this.showAllPagesModel);
}
class DeleatePagesSuccess extends PagesState {
  final  DelatePageModel showAllPagesModel;
  DeleatePagesSuccess(this.showAllPagesModel);
}
class PagesFailed extends PagesState {
  final String error;
  PagesFailed(this.error);
}
