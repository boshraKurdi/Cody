part of 'code_bloc.dart';

@immutable
sealed class CodeState {}

final class CodeInitial extends CodeState {}
final class CodeLoading extends CodeState {}
class ShowCodeSuccess extends CodeState {
  final  ShowCodeModel showAllCodeModel;
  ShowCodeSuccess(this.showAllCodeModel);
}
class addCodeToaNewProjectSuccess extends CodeState {
  final  AddCodeToANewProjectModel showAllCodeModel;
  addCodeToaNewProjectSuccess(this.showAllCodeModel);
}
class addCodeToAnExistingPageSuccess extends CodeState {
  final  AddCodeToAnExecitedPageModel showAllCodeModel;
  addCodeToAnExistingPageSuccess(this.showAllCodeModel);
}
class addCodeToAnNewPageWithAnNewFeatureSuccess extends CodeState {
  final  AddCodeToAnNewPageAndNewFeatureModel showAllCodeModel;
  addCodeToAnNewPageWithAnNewFeatureSuccess(this.showAllCodeModel);
}
class addCodeToAnNewPageWithAnExectingFeature extends CodeState {
  final  AddCodeToAnNewPageWithExistedFeatureModel showAllCodeModel;
  addCodeToAnNewPageWithAnExectingFeature(this.showAllCodeModel);
}
class CodeFailed extends CodeState {
  final String error;
  CodeFailed(this.error);
}

