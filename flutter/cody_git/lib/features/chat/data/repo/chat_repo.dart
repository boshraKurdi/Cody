
import 'package:cody/features/chat/data/models/create_chat_model.dart';
import 'package:cody/features/chat/data/models/create_messages_for_ai_model.dart';
import 'package:cody/features/chat/data/models/create_messages_for_user_model.dart';
import 'package:cody/features/chat/data/models/get_messages_for_chat_model.dart';
import 'package:cody/features/chat/data/models/index_chat_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../common wedgit/errors/failures.dart';



abstract class ChatRepo
{
  Future<Either<Failure,IndexChatModel>>index();
  Future<Either<Failure,CreateChatModel>>createChat({required String title});
  Future<Either<Failure,GetMessagesForChatModel>>getMessageForChat({required int ChatId});
  Future<Either<Failure,CreateMessagesForAiModel>>createMessagesForAiModel({required int chat_id,required String text});
  Future<Either<Failure,CreateMessagesForUserModel>>createMessagesForUserModel({required int chat_id,required String text});

}