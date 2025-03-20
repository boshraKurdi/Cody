part of 'create_session_bloc.dart';

@immutable
sealed class CreateSessionState {}

final class CreateSessionInitial extends CreateSessionState {}
class CreateSessionLoading extends CreateSessionState {}
class CreateCreateSessionSuccess extends CreateSessionState {
  final  CreateChatModel showAllPagesModel;
  CreateCreateSessionSuccess(this.showAllPagesModel);
}
class CreateSessionFailed extends CreateSessionState {
  final String error;
  CreateSessionFailed(this.error);
}
