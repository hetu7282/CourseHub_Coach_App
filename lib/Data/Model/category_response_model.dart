class CategoryResponseModel {
  bool? status;
  String? message;
  List<CategoryData>? data;

  CategoryResponseModel({this.status, this.message, this.data});

  CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoryData>[];
      json['data'].forEach((v) {
        data!.add(CategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryData {
  int? id;
  String? category;
  String? createdAt;
  String? updateAt;

  CategoryData({this.id, this.category, this.createdAt, this.updateAt});

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    createdAt = json['created_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['created_at'] = createdAt;
    data['update_at'] = updateAt;
    return data;
  }
}
