class AboutUsResponseModel {
  bool? status;
  String? message;
  Data? data;

  AboutUsResponseModel({this.status, this.message, this.data});

  AboutUsResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? aboutus;
  String? updateAt;

  Data({this.createdAt, this.id, this.aboutus, this.updateAt});

  Data.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    id = json['id'];
    aboutus = json['aboutus'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_at'] = createdAt;
    data['id'] = id;
    data['aboutus'] = aboutus;
    data['update_at'] = updateAt;
    return data;
  }
}
