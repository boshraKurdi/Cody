class GetFeaturePageModel {
  List<Data>? data;

  GetFeaturePageModel({this.data});

  GetFeaturePageModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  int? featureId;
  String? createdAt;
  String? updatedAt;
  List<Null>? media;

  Data(
      {this.id,
        this.title,
        this.description,
        this.featureId,
        this.createdAt,
        this.updatedAt,
        this.media});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    featureId = json['feature_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['feature_id'] = this.featureId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
  
    return data;
  }
}