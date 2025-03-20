part of 'pages_bloc.dart';

@immutable
sealed class PagesEvent {}

class getAllCodeForPageEvent extends PagesEvent{
  final  int PageId;
  getAllCodeForPageEvent(this.PageId);
}
class createPagesEvent extends PagesEvent{
  final String title;
  final String description;
  final int feature_id;
  createPagesEvent(this.title, this.description, this.feature_id);
}
class updatePagesEvent extends PagesEvent{
  final int PageId;
  final String title;
  final String description;
  final int Feautre_id;
  updatePagesEvent(this.PageId, this.title, this.description, this.Feautre_id);
}
class showPagessEvent extends PagesEvent{
  final int PageId;
  showPagessEvent(this.PageId);
}
class deleatePagesEvent extends PagesEvent{
  final int PageId;
  deleatePagesEvent(this.PageId);
}


