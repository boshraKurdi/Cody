class AddCodeToAnNewPageWithExistedFeatureModel {
  String? message;
  Data? data;

  AddCodeToAnNewPageWithExistedFeatureModel({this.message, this.data});

  AddCodeToAnNewPageWithExistedFeatureModel.fromJson(
      Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? title;
  String? description;
  String? code;
  int? pageId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.title,
        this.description,
        this.code,
        this.pageId,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    code = json['code'];
    pageId = json['page_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['code'] = this.code;
    data['page_id'] = this.pageId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}