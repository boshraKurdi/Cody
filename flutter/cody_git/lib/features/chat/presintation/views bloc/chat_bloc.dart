import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/create_chat_model.dart';
import '../../data/models/create_messages_for_ai_model.dart';
import '../../data/models/create_messages_for_user_model.dart';
import '../../data/models/get_messages_for_chat_model.dart';
import '../../data/models/index_chat_model.dart';
import '../../data/repo/chat_repo.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepo projectsRepo;
  ChatBloc(this.projectsRepo) : super(ChatState(messages: [])) {
    on<SendChat>((event, emit) async {
      var result = await  projectsRepo.createMessagesForUserModel(chat_id: event.chat_id, text: event.text);
      result.fold((failure) => emit(ChatFailed(failure.errMassage, messages: [])),
              (user) {
                final List<String> updatedChats = List.from(state.messages)..add("You: ${event.message}");
            //    updatedChats.add("You: ${user.message!}");
                emit(state.copyWith(messages: updatedChats));
                add(ReceiveChat("AI:'${user.data}'"));
          });

    });
    on<ReceiveChat>((event, emit) async {
      final  List<String> updatedChats = List.from(state.messages)..add(event.message);
      emit(state.copyWith(messages: updatedChats));
    });
    // on<LoadChats>((event, emit) async {
    //     emit(ChatLoading(messages: []));
    //     var result = await  projectsRepo.getMessageForChat(ChatId: event.ChatId);
    //     result.fold((failure) => emit(ChatFailed(failure.errMassage, messages: [])),
    //             (user) {
    //               emit(state.copyWith(messages: user.data!.messages!));
    //         });
    // });
    // on<createChatsForUserModeEvent>((event, emit) async {
    //   emit(ChatLoading(messages: []));
    //   var result = await  projectsRepo.createMessagesForUserModel(chat_id: event.chat_id, text: event.text);
    //   result.fold((failure) => emit(ChatFailed(failure.errMassage, messages: [])),
    //           (user) {
    //             emit(state.copyWith(messages: user.data!.));
    //           });
    // });
    // on<createChatEvent>((event, emit) async {
    //   emit(ChatLoading());
    //   var result = await  projectsRepo.createChat(title: event.title);
    //   result.fold((failure) => emit(ChatFailed(failure.errMassage)),
    //           (user) {
    //         emit(CreateChatSuccess(user));
    //       });
    // });
    // on<createChatsForAiModelEvent>((event, emit) async {
    //   emit(ChatLoading());
    //   var result = await  projectsRepo.createChatsForAiModel(chat_id: event.chat_id, text: event.text);
    //   result.fold((failure) => emit(ChatFailed(failure.errMassage)),
    //           (user) {
    //         emit( CreateChatsForAiSuccess(user));
    //       });
    // });
    // on<createChatsForUserModeEvent>((event, emit) async {
    //   emit(ChatLoading());
    //   var result = await  projectsRepo.createChatsForUserModel(chat_id: event.chat_id, text: event.text);
    //   result.fold((failure) => emit(ChatFailed(failure.errMassage)),
    //           (user) {
    //         emit(CreateChatsForUserSuccess(user));
    //       });
    // });
    // on<getChatForChatEvent>((event, emit) async {
    //   emit(ChatLoading());
    //   var result = await  projectsRepo.getChatForChat(ChatId: event.ChatId);
    //   result.fold((failure) => emit(ChatFailed(failure.errMassage)),
    //           (user) {
    //         emit(GetChatsForChatSuccess(user));
    //       });
    // });

  }
}



// class ChatBloc extends Bloc<ChatEvent, ChatState> {
//   final ChatRepo projectsRepo;
//   ChatBloc() : super(ChatState(messages: []));
//
//   @override
//   Stream<ChatState> mapEventToState(ChatEvent event) async* {
//     if (event is SendChat) {
//
//     } else if (event is ReceiveChat) {
//
//     } else if (event is LoadChats) {
//       // Load messages if needed
//       yield state; // For now, we just return the current state
//     }
//   }
// }
