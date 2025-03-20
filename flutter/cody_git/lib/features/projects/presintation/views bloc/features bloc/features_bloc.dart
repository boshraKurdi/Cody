import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/feature/create_feature_model.dart';
import '../../../data/models/feature/deleate_feature_model.dart';
import '../../../data/models/feature/get_features_pages_model.dart';
import '../../../data/models/feature/show_features_model.dart';
import '../../../data/models/feature/update_feature_model.dart';
import '../../../data/repo/featured repo.dart';

part 'features_event.dart';
part 'features_state.dart';

class FeaturesBloc extends Bloc<FeaturesEvent, FeaturesState> {
  final FeaturesRepo projectsRepo;
  FeaturesBloc(this.projectsRepo) : super(FeaturesInitial()) {
    on<getAllPages>((event, emit) async {
      emit(FeaturesLoading());
      var result = await  projectsRepo.getAllPages(FeatureId: event.FeatureId);
      result.fold((failure) => emit(FeaturesFailed(failure.errMassage)),
              (user) {
            emit(GetAllPagesSuccess(user));
          });
    });
    on<createFeaturesEvent>((event, emit) async {
      emit(FeaturesLoading());
      var result = await  projectsRepo.createFeature(title: event.title, description: event.description, project_id: event.project_id);
      result.fold((failure) => emit(FeaturesFailed(failure.errMassage)),
              (user) {
            emit(CreateFeaturesSuccess(user));
          });
    });
    on<updateFeaturesEvent>((event, emit) async {
      emit(FeaturesLoading());
      var result = await  projectsRepo.uodateFeature(title: event.title, description: event.description, FeatureId: event.Feautre_id, project_id: event.projectId);
      result.fold((failure) => emit(FeaturesFailed(failure.errMassage)),
              (user) {
            emit(UpdateFeaturesSuccess(user));
          });
    });
    on<deleateFeaturesEvent>((event, emit) async {
      emit(FeaturesLoading());
      var result = await  projectsRepo.deleateFeature(FeatureId: event.featureId);
      result.fold((failure) => emit(FeaturesFailed(failure.errMassage)),
              (user) {
            emit(DeleateFeaturesSuccess(user));
          });
    });
    on<showFeaturessEvent>((event, emit) async {
      emit(FeaturesLoading());
      var result = await  projectsRepo.showFeatures(FeatureId: event.featureId);
      result.fold((failure) => emit(FeaturesFailed(failure.errMassage)),
              (user) {
            emit(ShowFeaturesDetailesSuccess(user));
          });
    });
  }
}
