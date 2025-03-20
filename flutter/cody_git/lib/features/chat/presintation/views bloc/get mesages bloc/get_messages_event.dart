part of 'get_messages_bloc.dart';

@immutable
sealed class GetMessagesEvent {}
class indexEvent extends GetMessagesEvent{
}
class getChatForChatEvent extends GetMessagesEvent{
  final int ChatId;
  getChatForChatEvent(this.ChatId);
}