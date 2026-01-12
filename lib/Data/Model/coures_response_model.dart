class CouresResponseModel {
  bool? status;
  String? message;
  List<Coursedata>? coursedata;

  CouresResponseModel({this.status, this.message, this.coursedata});

  CouresResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['coursedata'] != null) {
      coursedata = <Coursedata>[];
      json['coursedata'].forEach((v) {
        coursedata!.add(Coursedata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (coursedata != null) {
      data['coursedata'] = coursedata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Coursedata {
  int? coachId;
  String? courseDes;
  int? categoryId;
  String? courseName;
  int? price;
  String? updateAt;
  String? createdAt;
  int? id;
  bool? enable;
  String? bannerimage;

  Coursedata(
      {this.coachId,
      this.courseDes,
      this.enable,
      this.categoryId,
      this.courseName,
      this.price,
      this.updateAt,
      this.createdAt,
      this.id,
      this.bannerimage});

  Coursedata.fromJson(Map<String, dynamic> json) {
    coachId = json['coach_id'];
    courseDes = json['course_des'];
    categoryId = json['category_id'];
    courseName = json['course_name'];
    price = json['price'];
    updateAt = json['update_at'];
    createdAt = json['created_at'];
    id = json['id'];
    enable = json['enable'];
    bannerimage = json['bannerimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coach_id'] = coachId;
    data['course_des'] = courseDes;
    data['enable'] = enable;
    data['category_id'] = categoryId;
    data['course_name'] = courseName;
    data['price'] = price;
    data['update_at'] = updateAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['bannerimage'] = bannerimage;
    return data;
  }
}
