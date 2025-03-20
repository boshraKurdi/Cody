import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/create_chat_model.dart';
import '../../../data/repo/chat_repo.dart';

part 'create_session_event.dart';
part 'create_session_state.dart';

class CreateSessionBloc extends Bloc<CreateSessionEvent, CreateSessionState> {
  final ChatRepo projectsRepo;
  CreateSessionBloc(this.projectsRepo) : super(CreateSessionInitial()) {
    on<CreateSessionEvent>((event, emit) async {
      emit(CreateSessionLoading());
      var result = await  projectsRepo.createChat(title: event.title);
      result.fold((failure) => emit(CreateSessionFailed(failure.errMassage)),
              (user) {
            emit(CreateCreateSessionSuccess(user));
          });
    });

  }
}
