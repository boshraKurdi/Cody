part of 'code_bloc.dart';

@immutable
sealed class CodeEvent {}

class showCodeEvent extends CodeEvent{
  final  int CodeId;
  showCodeEvent(this.CodeId);
}
class addCodeToaNewProjectEvent extends CodeEvent{
  final String project_title;
  final String project_description;
  final String language;
  final String feature_title;
  final String page_title;
  final String code_title;
  final String code_description;
  final String code_content;
  addCodeToaNewProjectEvent(this.project_title, this.project_description, this.language, this.feature_title, this.page_title, this.code_title, this.code_description, this.code_content);
}
class addCodeToAnExistingPageEvent extends CodeEvent{
  final String title;
  final String code;
  final String description;
  final String page_id;
  addCodeToAnExistingPageEvent(this.title, this.code, this.description, this.page_id);
}
class addCodeToAnNewPageWithAnNewFeature extends CodeEvent{
  final String feature_title;
  final String page_title;
  final String code_title;
  final String code_description;
  final String code_content;
  final String page_description;
  final String feature_description;
  final int projectId;
  addCodeToAnNewPageWithAnNewFeature(this.feature_title, this.page_title, this.code_title, this.code_description, this.code_content, this.page_description, this.feature_description, this.projectId);
}
class addCodeToAnNewPageWithAnExectingFeatureEvent extends CodeEvent{
  final String page_title;
  final String code_title;
  final String code_description;
  final String page_description;
  final String code_content;
  final int FeatuerId;
  final int ProjectId;
  addCodeToAnNewPageWithAnExectingFeatureEvent(this.page_title, this.code_title, this.code_description, this.page_description, this.code_content, this.FeatuerId, this.ProjectId);
}


