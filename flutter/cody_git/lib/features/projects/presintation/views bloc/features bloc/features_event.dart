part of 'features_bloc.dart';

@immutable
sealed class FeaturesEvent {}

class getAllPages extends FeaturesEvent{
  final  int FeatureId;
  getAllPages(this.FeatureId);
}
class createFeaturesEvent extends FeaturesEvent{
  final String title;
  final String description;
  final int project_id;
  createFeaturesEvent(this.title, this.description, this.project_id);
}
class updateFeaturesEvent extends FeaturesEvent{
  final int projectId;
  final String title;
  final String description;
  final int Feautre_id;
  updateFeaturesEvent(this.projectId, this.title, this.description, this.Feautre_id);
}
class showFeaturessEvent extends FeaturesEvent{
  final int featureId;
  showFeaturessEvent(this.featureId);
}
class deleateFeaturesEvent extends FeaturesEvent{
  final int featureId;
  deleateFeaturesEvent(this.featureId);
}

