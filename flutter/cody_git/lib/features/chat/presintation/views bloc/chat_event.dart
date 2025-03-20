part of 'chat_bloc.dart';
//
// @immutable
// sealed class ChatEvent {}
//
//

// class createChatEvent extends ChatEvent{
//   final String title;
//   createChatEvent(this.title);
// }
// class getChatForChatEvent extends ChatEvent{
//   final int ChatId;
//   getChatForChatEvent(this.ChatId);
// }
// class createChatsForAiModelEvent extends ChatEvent{
//   final int chat_id;
//   final String text;
//   createChatsForAiModelEvent(this.chat_id, this.text);
// }
class createChatsForUserModeEvent extends ChatEvent{
  final int chat_id;
  final String text;
  createChatsForUserModeEvent(this.chat_id, this.text);
}

// message_event.dart
abstract class ChatEvent {}

class SendChat extends ChatEvent {
  final String message;
  final int chat_id;
  final String text;
  SendChat(this.message, this.chat_id, this.text);
}

class ReceiveChat extends ChatEvent {
  final String message;

  ReceiveChat(this.message);
}

class LoadChats extends ChatEvent {
  final int ChatId;
  LoadChats(this.ChatId);
}

