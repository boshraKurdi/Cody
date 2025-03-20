part of 'get_messages_bloc.dart';

@immutable
sealed class GetMessagesState {}

final class GetMessagesInitial extends GetMessagesState {}
class IndexChatSuccess extends GetMessagesState {
  final  IndexChatModel showAllPagesModel;
  IndexChatSuccess(this.showAllPagesModel);
}
class GetChatSuccess extends GetMessagesState {
  final  GetMessagesForChatModel showAllPagesModel;
GetChatSuccess(this.showAllPagesModel);
}

class ChatLoading extends GetMessagesState {
  ChatLoading();
}

class ChatFailed extends GetMessagesState {
  final String error;
  ChatFailed(this.error, );
}
