class SliderImageResponseModel {
  bool? status;
  String? message;
  List<ImageData>? data;

  SliderImageResponseModel({this.status, this.message, this.data});

  SliderImageResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ImageData>[];
      json['data'].forEach((v) {
        data!.add(ImageData.fromJson(v));
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

class ImageData {
  int? id;
  String? imagerul;

  ImageData({this.id, this.imagerul});

  ImageData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagerul = json['imagerul'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imagerul'] = imagerul;
    return data;
  }
}
