class AddCodeToAnExecitedPageModel {
  Data? data;
  String? message;

  AddCodeToAnExecitedPageModel({this.data, this.message});

  AddCodeToAnExecitedPageModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? title;
  String? code;
  String? description;
  String? pageId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.title,
        this.code,
        this.description,
        this.pageId,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    code = json['code'];
    description = json['description'];
    pageId = json['page_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['code'] = this.code;
    data['description'] = this.description;
    data['page_id'] = this.pageId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}