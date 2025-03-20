part of 'features_bloc.dart';

@immutable
sealed class FeaturesState {}

final class FeaturesInitial extends FeaturesState {}
class FeaturesLoading extends FeaturesState {}

class GetAllPagesSuccess extends FeaturesState {
  final  GetFeaturePageModel showAllFeaturesModel;
  GetAllPagesSuccess(this.showAllFeaturesModel);

}
class CreateFeaturesSuccess extends FeaturesState {
  final  CreateFeatureModel showAllFeaturesModel;
  CreateFeaturesSuccess(this.showAllFeaturesModel);
}
class UpdateFeaturesSuccess extends FeaturesState {
  final  UpdateFeatureModel showAllFeaturesModel;
  UpdateFeaturesSuccess(this.showAllFeaturesModel);
}
class ShowFeaturesDetailesSuccess extends FeaturesState {
  final ShowFeatureModel showAllFeaturesModel;
  ShowFeaturesDetailesSuccess(this.showAllFeaturesModel);
}
class DeleateFeaturesSuccess extends FeaturesState {
  final  DelateFeatureModel showAllFeaturesModel;
  DeleateFeaturesSuccess(this.showAllFeaturesModel);
}
class FeaturesFailed extends FeaturesState {
  final String error;
  FeaturesFailed(this.error);
}
