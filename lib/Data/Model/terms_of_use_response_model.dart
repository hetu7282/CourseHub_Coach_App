class TermsOfUseResponseModel {
  bool? status;
  String? message;
  Data? data;

  TermsOfUseResponseModel({this.status, this.message, this.data});

  TermsOfUseResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? createdAt;
  int? id;
  String? terms;
  String? updateAt;

  Data({this.createdAt, this.id, this.terms, this.updateAt});

  Data.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    id = json['id'];
    terms = json['terms'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_at'] = createdAt;
    data['id'] = id;
    data['terms'] = terms;
    data['update_at'] = updateAt;
    return data;
  }
}
