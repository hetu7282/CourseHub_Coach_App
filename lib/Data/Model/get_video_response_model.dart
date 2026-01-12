class GetVideoResponseModel {
  bool? status;
  String? message;
  List<VideoData>? data;

  GetVideoResponseModel({this.status, this.message, this.data});

  GetVideoResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <VideoData>[];
      json['data'].forEach((v) {
        data!.add(VideoData.fromJson(v));
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

class VideoData {
  int? id;
  int? courseId;
  String? videoTitle;
  String? videoSubtitle;
  bool? enable;
  String? videoLink;
  String? createdAt;
  String? updateAt;

  VideoData(
      {this.id,
      this.courseId,
      this.videoTitle,
      this.videoSubtitle,
      this.enable,
      this.videoLink,
      this.createdAt,
      this.updateAt});

  VideoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    videoTitle = json['video_title'];
    videoSubtitle = json['video_subtitle'];
    videoLink = json['video_link'];
    createdAt = json['created_at'];
    enable = json['enable'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['course_id'] = courseId;
    data['video_title'] = videoTitle;
    data['video_subtitle'] = videoSubtitle;
    data['video_link'] = videoLink;
    data['created_at'] = createdAt;
    data['enable'] = enable;
    data['update_at'] = updateAt;
    return data;
  }
}
