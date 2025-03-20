import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/create_chat_model.dart';
import '../../../data/models/get_messages_for_chat_model.dart';
import '../../../data/models/index_chat_model.dart';
import '../../../data/repo/chat_repo.dart';

part 'get_messages_event.dart';
part 'get_messages_state.dart';

class GetMessagesBloc extends Bloc<GetMessagesEvent, GetMessagesState> {
  final ChatRepo projectsRepo;
  GetMessagesBloc(this.projectsRepo) : super(GetMessagesInitial()) {
    on<getChatForChatEvent>((event, emit) async {
      emit(ChatLoading());
      var result = await  projectsRepo.getMessageForChat(ChatId: event.ChatId);
      result.fold((failure) => emit(ChatFailed(failure.errMassage)),
              (user) {
            emit(GetChatSuccess(user));
          });
    });
    on<indexEvent>((event, emit) async {
      emit(ChatLoading());
      var result = await  projectsRepo.index();
      result.fold((failure) => emit(ChatFailed(failure.errMassage)),
              (user) {
            emit(IndexChatSuccess(user));
          });
    });
  }
}
