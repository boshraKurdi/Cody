import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/projects/get_faviorate_model.dart';
import '../../../data/models/projects/set_favorate_project.dart';
import '../../../data/repo/project_repo.dart';

part 'favorait_project_event.dart';
part 'favorait_project_state.dart';

class FavoraitProjectBloc extends Bloc<FavoraitProjectEvent, FavoraitProjectState> {
  final ProjectsRepo projectsRepo;
  FavoraitProjectBloc(this.projectsRepo) : super(FavoraitProjectInitial()) {
    on<getFavoraitProject>((event, emit) async {
      emit(FeavoraitProjectLoading());
      var result = await projectsRepo.getVavorateProject();
      result.fold((failure) => emit(FavoraitProjectFailed(failure.errMassage)),
              (user) {
            emit(FavoraitProjectSuccess(user));
          });
    });
    on<SetFavoraitProject>((event, emit) async {
      emit(FeavoraitProjectLoading());
      var result = await projectsRepo.addyoFavorateProject(projectId: event.projectId);
      result.fold((failure) => emit(FavoraitProjectFailed(failure.errMassage)),
              (user) {
            emit(SetFavoraitProjectSuccess(user));
          });
    });
  }
}
