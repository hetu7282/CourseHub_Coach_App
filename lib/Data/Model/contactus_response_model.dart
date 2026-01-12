class ContactUsResponseModel {
  bool? status;
  String? message;
  Data? data;

  ContactUsResponseModel({this.status, this.message, this.data});

  ContactUsResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? email;
  String? telegramno;
  String? contactno1;
  String? contactno2;
  String? whatsappno;
  String? address;
  String? updateAt;

  Data(
      {this.createdAt,
      this.id,
      this.email,
      this.telegramno,
      this.contactno1,
      this.contactno2,
      this.whatsappno,
      this.address,
      this.updateAt});

  Data.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    id = json['id'];
    email = json['email'];
    telegramno = json['telegramno'];
    contactno1 = json['contactno1'];
    contactno2 = json['contactno2'];
    whatsappno = json['whatsappno'];
    address = json['address'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_at'] = createdAt;
    data['id'] = id;
    data['email'] = email;
    data['telegramno'] = telegramno;
    data['contactno1'] = contactno1;
    data['contactno2'] = contactno2;
    data['whatsappno'] = whatsappno;
    data['address'] = address;
    data['update_at'] = updateAt;
    return data;
  }
}
