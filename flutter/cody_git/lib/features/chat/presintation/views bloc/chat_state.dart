part of 'chat_bloc.dart';

// @immutable
// sealed class ChatState {}

// message_state.dart
class ChatState {
  final List<String> messages;

  ChatState({required this.messages});

  ChatState copyWith({List<String>? messages}) {
    return ChatState(messages: messages ?? this.messages);
  }
}
//
// final class ChatInitial extends ChatState {}
class ChatLoading extends ChatState {
  ChatLoading({required super.messages});
}

class GetMessagesForChatSuccess extends ChatState {
  final  GetMessagesForChatModel showAllPagesModel;
  GetMessagesForChatSuccess(this.showAllPagesModel, {required super.messages});
}
// class CreateMessagesForAiSuccess extends ChatState {
//   final  CreateMessagesForAiModel showAllPagesModel;
//   CreateMessagesForAiSuccess(this.showAllPagesModel);
// }
class CreateMessagesForUserSuccess extends ChatState {
  final  CreateMessagesForUserModel showAllPagesModel;
CreateMessagesForUserSuccess(this.showAllPagesModel, {required super.messages});
}
class ChatFailed extends ChatState {
  final String error;
 ChatFailed(this.error,  {required super.messages});
}
//
