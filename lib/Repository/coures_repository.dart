// ignore_for_file: unused_import

import 'package:coach_app/Data/Api/api_manager.dart';
import 'package:coach_app/Data/Api/dio_manager.dart';
import 'package:coach_app/Data/Api/post_api_manager.dart';
import 'package:coach_app/Data/Model/coures_add_response_model.dart';
import 'package:coach_app/Data/Model/coures_response_model.dart';
import 'package:coach_app/Data/Model/get_buy_user_response_model.dart';
import 'package:coach_app/Data/Model/get_video_response_model.dart';
import 'package:coach_app/Data/Model/login_response_model.dart';
import 'package:coach_app/Data/Model/upload_image_response_model.dart';
import 'package:coach_app/Data/Model/video_add_response_model.dart';
import 'package:coach_app/Utils/string_constant.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class CouresRepository {
  final APIManager apiManager;
  final PostAPIManager postAPIManager;
  DioManager dioManager = DioManager();

  CouresRepository(this.apiManager, this.postAPIManager);



//********************** Update Enable Video data api call **********************//

  Future<VideoAddResponsemodel> updateEnableVideoAPICall({
    required enable,
    required videoId,
    required courseId,
  }) async {
    var jsonData = await apiManager.postAPICall(
      url: '${baseUrl}coures/get-enable-video/$videoId',
      params: {
        "course_id": courseId,
        "enable": enable,
      },
    );
    var response = VideoAddResponsemodel.fromJson(jsonData);

    return response;
  }

//********************** video data api call **********************//

  Future<GetVideoResponseModel> getVideoDataAPICall({
    required courseId,
  }) async {
    var jsonData = await apiManager.postAPICall(
      url: '${baseUrl}coures/get-video',
      params: {
        "course_id": courseId,
        
      },
    );
    var response = GetVideoResponseModel.fromJson(jsonData);

    return response;
  }

//********************** delete video data api call **********************//

  Future<VideoAddResponsemodel> deleteVideoDataAPICall({
    required courseId,
    required videoId,
  }) async {
    var jsonData = await apiManager.postAPICall(
      url: '${baseUrl}coures/delete-video/$videoId',
      params: {
        "course_id": courseId,
      },
    );
    var response = VideoAddResponsemodel.fromJson(jsonData);

    return response;
  }

//********************** Edit video data api call **********************//

  Future<VideoAddResponsemodel> editVideoDataAPICall({
    required courseId,
    required videoId,
    required videoTitle,
    required videoSubtitle,
    required videoLink,
  }) async {
    var jsonData = await apiManager.postAPICall(
      url: '${baseUrl}coures/update-video/$videoId',
      params: {
        "course_id": courseId,
        "video_title": videoTitle,
        "video_subtitle": videoSubtitle,
        "video_link": videoLink,
      },
    );
    var response = VideoAddResponsemodel.fromJson(jsonData);

    return response;
  }

//********************** Add video data api call **********************//

  Future<VideoAddResponsemodel> addVideoDataAPICall({
    required courseId,
    required videoTitle,
    required videoSubtitle,
    required videoLink,
  }) async {
    var jsonData = await apiManager.postAPICall(
      url: '${baseUrl}coures/add-video',
      params: {
        "course_id": courseId,
        "video_title": videoTitle,
        "video_subtitle": videoSubtitle,
        "video_link": videoLink,
        "enable": true,

      },
    );
    var response = VideoAddResponsemodel.fromJson(jsonData);

    return response;
  }

//********************** coures data api call **********************//

  Future<CouresResponseModel> couresDataAPICall({
    required categoryId,
  }) async {
    var jsonData = await apiManager.postAPICall(
      url: '${baseUrl}coures/get-category-courese',
      params: {
        "category_id": categoryId,
        "coach_id": LoginResponseModel.fromJson(
          GetStorage().read(
            userData,
          ),
        ).userdata!.id,
      },
    );
    var response = CouresResponseModel.fromJson(jsonData);

    return response;
  }

//********************** Coures Add api call **********************//

  Future<CouresAddResponseModel> couresAddDataAPICall({
    required categoryId,
    required coursename,
    required coursedes,
    required bannerimage,
    required price,
  }) async {
    var jsonData = await apiManager.postAPICall(
      url: '${baseUrl}coures/add-coures',
      params: {
        "category_id": categoryId,
        "coach_id": LoginResponseModel.fromJson(
          GetStorage().read(
            userData,
          ),
        ).userdata!.id,
        "course_name": coursename,
        "course_des": coursedes,
        "bannerimage": bannerimage,
        "enable": true,
        "price": price,
      },
    );
    var response = CouresAddResponseModel.fromJson(jsonData);

    return response;
  }

//********************** Coures delete api call **********************//

  Future<CouresAddResponseModel> couresDeleteDataAPICall({
    required coureseId,
  }) async {
    var jsonData = await apiManager.postAPICall(
      url: '${baseUrl}coures/delete-coures/$coureseId',
      params: {
      },
    );
    var response = CouresAddResponseModel.fromJson(jsonData);

    return response;
  }


//********************** Coures Update api call **********************//

  Future<CouresAddResponseModel> couresUpdateDataAPICall({
    required categoryId,
    required couresId,
    required coursename,
    required coursedes,
    required bannerimage,
    required price,
  }) async {
    var jsonData = await apiManager.postAPICall(
      url: '${baseUrl}coures/update-coures/$couresId',
      params: {
        "category_id": categoryId,
        "course_name": coursename,
        "course_des": coursedes,
        "bannerimage": bannerimage,
        "price": price,
      },
    );
    var response = CouresAddResponseModel.fromJson(jsonData);

    return response;
  }


//********************** Update Enable Course data api call **********************//

  Future<VideoAddResponsemodel> updateEnableCourseAPICall({
    required enable,
    required courseId,
  }) async {
    var jsonData = await apiManager.postAPICall(
      url: '${baseUrl}coures/get-enable-coures/$courseId',
      params: {
        "enable": enable,
      },
    );
    var response = VideoAddResponsemodel.fromJson(jsonData);

    return response;
  }

  //********************** uplode image api call **********************//

  Future<UploadImageResponseModel> uploadImageApiCall(
      {required List<int> image, required String imageName}) async {
    Map<String, dynamic> params = {
      "image": MultipartFile.fromBytes(image,
          contentType: MediaType('image', 'jpg'), filename: imageName),
    };

    FormData formData = FormData.fromMap(params);
    dynamic response = await dioManager.postApiCall(
      url: '${baseUrl}admin/upload-image',
      formData: formData,
    );

    UploadImageResponseModel data = UploadImageResponseModel.fromJson(response);
    return data;
  }
  

//********************** Get buy User data api call **********************//

  Future<GetBuyUserResponseModel> getBuyUserDataAPICall() async {
    var jsonData = await apiManager.postAPICall(
      url: '${baseUrl}coures/get-buy-user',
      params: {
        "coach_id": LoginResponseModel.fromJson(
          GetStorage().read(
            userData,
          ),
        ).userdata!.id,
      },
    );
    var response = GetBuyUserResponseModel.fromJson(jsonData);

    return response;
  }

}
