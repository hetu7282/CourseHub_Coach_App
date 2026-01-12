class GetBuyUserResponseModel {
  bool? status;
  String? message;
  List<Paymentdata>? paymentdata;

  GetBuyUserResponseModel({this.status, this.message, this.paymentdata});

  GetBuyUserResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['paymentdata'] != null) {
      paymentdata = <Paymentdata>[];
      json['paymentdata'].forEach((v) {
        paymentdata!.add(Paymentdata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (paymentdata != null) {
      data['paymentdata'] = paymentdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Paymentdata {
  int? coachId;
  String? expireDate;
  int? userId;
  String? totalAmount;
  String? totalMounth;
  String? paymentId;
  int? price;
  String? updateAt;
  String? createdAt;
  int? id;
  String? startDate;
  int? courseId;
  User? user;
  Course? course;

  Paymentdata(
      {this.coachId,
      this.expireDate,
      this.userId,
      this.totalAmount,
      this.totalMounth,
      this.paymentId,
      this.price,
      this.updateAt,
      this.createdAt,
      this.id,
      this.startDate,
      this.courseId,
      this.user,
      this.course});

  Paymentdata.fromJson(Map<String, dynamic> json) {
    coachId = json['coach_id'];
    expireDate = json['expire_date'];
    userId = json['user_id'];
    totalAmount = json['total_amount'];
    totalMounth = json['total_mounth'];
    paymentId = json['payment_id'];
    price = json['price'];
    updateAt = json['update_at'];
    createdAt = json['created_at'];
    id = json['id'];
    startDate = json['start_date'];
    courseId = json['course_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    course =
        json['course'] != null ? Course.fromJson(json['course']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coach_id'] = coachId;
    data['expire_date'] = expireDate;
    data['user_id'] = userId;
    data['total_amount'] = totalAmount;
    data['total_mounth'] = totalMounth;
    data['payment_id'] = paymentId;
    data['price'] = price;
    data['update_at'] = updateAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['start_date'] = startDate;
    data['course_id'] = courseId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (course != null) {
      data['course'] = course!.toJson();
    }
    return data;
  }
}

class User {
  String? role;
  String? createdAt;
  String? password;
  int? id;
  String? email;
  String? username;
  String? country;
  String? gender;
  String? city;
  String? telegramno;
  String? whatsapp;
  String? mobile;
  String? image;
  String? updateAt;

  User(
      {this.role,
      this.createdAt,
      this.password,
      this.id,
      this.email,
      this.username,
      this.country,
      this.gender,
      this.city,
      this.telegramno,
      this.whatsapp,
      this.mobile,
      this.image,
      this.updateAt});

  User.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    createdAt = json['created_at'];
    password = json['password'];
    id = json['id'];
    email = json['email'];
    username = json['username'];
    country = json['country'];
    gender = json['gender'];
    city = json['city'];
    telegramno = json['telegramno'];
    whatsapp = json['whatsapp'];
    mobile = json['mobile'];
    image = json['image'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['created_at'] = createdAt;
    data['password'] = password;
    data['id'] = id;
    data['email'] = email;
    data['username'] = username;
    data['country'] = country;
    data['gender'] = gender;
    data['city'] = city;
    data['telegramno'] = telegramno;
    data['whatsapp'] = whatsapp;
    data['mobile'] = mobile;
    data['image'] = image;
    data['update_at'] = updateAt;
    return data;
  }
}

class Course {
  int? coachId;
  int? categoryId;
  int? price;
  String? createdAt;
  int? id;
  String? courseName;
  String? updateAt;
  String? courseDes;
  String? bannerimage;

  Course(
      {this.coachId,
      this.categoryId,
      this.price,
      this.createdAt,
      this.id,
      this.courseName,
      this.updateAt,
      this.courseDes,
      this.bannerimage});

  Course.fromJson(Map<String, dynamic> json) {
    coachId = json['coach_id'];
    categoryId = json['category_id'];
    price = json['price'];
    createdAt = json['created_at'];
    id = json['id'];
    courseName = json['course_name'];
    updateAt = json['update_at'];
    courseDes = json['course_des'];
    bannerimage = json['bannerimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coach_id'] = coachId;
    data['category_id'] = categoryId;
    data['price'] = price;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['course_name'] = courseName;
    data['update_at'] = updateAt;
    data['course_des'] = courseDes;
    data['bannerimage'] = bannerimage;
    return data;
  }
}
