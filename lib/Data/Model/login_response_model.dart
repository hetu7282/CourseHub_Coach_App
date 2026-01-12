class LoginResponseModel {
  bool? status;
  String? message;
  Userdata? userdata;

  LoginResponseModel({this.status, this.message, this.userdata});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userdata = json['userdata'] != null
        ? Userdata.fromJson(json['userdata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (userdata != null) {
      data['userdata'] = userdata!.toJson();
    }
    return data;
  }
}

class Userdata {
  String? whatsapp;
  String? image;
  String? country;
  String? role;
  String? gender;
  String? city;
  String? mobile;
  String? createdAt;
  String? experience;
  String? telegramno;
  String? password;
  String? updateAt;
  int? id;
  String? email;
  String? username;

  Userdata(
      {this.whatsapp,
      this.image,
      this.country,
      this.role,
      this.gender,
      this.city,
      this.mobile,
      this.createdAt,
      this.experience,
      this.telegramno,
      this.password,
      this.updateAt,
      this.id,
      this.email,
      this.username});

  Userdata.fromJson(Map<String, dynamic> json) {
    whatsapp = json['whatsapp'];
    image = json['image'];
    country = json['country'];
    role = json['role'];
    gender = json['gender'];
    city = json['city'];
    mobile = json['mobile'];
    createdAt = json['created_at'];
    experience = json['experience'];
    telegramno = json['telegramno'];
    password = json['password'];
    updateAt = json['update_at'];
    id = json['id'];
    email = json['email'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['whatsapp'] = whatsapp;
    data['image'] = image;
    data['country'] = country;
    data['role'] = role;
    data['gender'] = gender;
    data['city'] = city;
    data['mobile'] = mobile;
    data['created_at'] = createdAt;
    data['experience'] = experience;
    data['telegramno'] = telegramno;
    data['password'] = password;
    data['update_at'] = updateAt;
    data['id'] = id;
    data['email'] = email;
    data['username'] = username;
    return data;
  }
}
