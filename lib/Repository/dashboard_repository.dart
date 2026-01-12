// ignore_for_file: non_constant_identifier_names, unused_import
import 'package:coach_app/Data/Api/post_api_manager.dart';
import 'package:coach_app/Data/Model/aboutus_response_model.dart';
import 'package:coach_app/Data/Model/category_response_model.dart';
import 'package:coach_app/Data/Model/chnage_password_model.dart';
import 'package:coach_app/Data/Model/contactus_response_model.dart';
import 'package:coach_app/Data/Model/login_response_model.dart';
import 'package:coach_app/Data/Model/terms_of_use_response_model.dart';
import 'package:coach_app/Data/Model/video_add_response_model.dart';
import 'package:coach_app/Utils/string_constant.dart';
import 'package:get_storage/get_storage.dart';

import '../Data/Api/api_manager.dart';
import '../Data/Model/slider_image_response_model.dart';

class DashboardRepository {
  final APIManager apiManager;
  final PostAPIManager postAPIManager;

  DashboardRepository(this.apiManager, this.postAPIManager);

//********************** Banner Image api call **********************//

  Future<SliderImageResponseModel> bannerImageDataAPICall() async {
    var jsonData = await apiManager.getAPICall(
      url: '${baseUrl}admin/get-slider-image',
    );
    var response = SliderImageResponseModel.fromJson(jsonData);
    return response;
  }

//********************** Category api call **********************//

  Future<CategoryResponseModel> categoryDataAPICall() async {
    var jsonData = await apiManager.getAPICall(
      url: '${baseUrl}admin/get-enable-categories',
    );
    var response = CategoryResponseModel.fromJson(jsonData);
    return response;
  }

  //********************** about us data api call **********************//

  Future<AboutUsResponseModel> aboutusDataAPICall() async {
    var jsonData = await apiManager.getAPICall(
      url: '${baseUrl}admin/get-aboutus',
    );
    var response = AboutUsResponseModel.fromJson(jsonData);
    return response;
  }

  //********************** contact us data api call **********************//

  Future<ContactUsResponseModel> contactusDataAPICall() async {
    var jsonData = await apiManager.getAPICall(
      url: '${baseUrl}admin/get-contactus',
    );
    var response = ContactUsResponseModel.fromJson(jsonData);
    return response;
  }

  //********************** Terms of use data api call **********************//

  Future<TermsOfUseResponseModel> termsOfUseDataAPICall() async {
    var jsonData = await apiManager.getAPICall(
      url: '${baseUrl}admin/get-terms',
    );
    var response = TermsOfUseResponseModel.fromJson(jsonData);
    return response;
  }

  //********************** chnage pssword data api call **********************//

  Future<ChangePasswordResponseModel> chnagePasswordAPICall(
      {required String password}) async {
    var jsonData = await apiManager.postAPICall(
      url: '${baseUrl}coach/changepassword',
      params: {
        "email": LoginResponseModel.fromJson(
          GetStorage().read(
            userData,
          ),
        ).userdata!.email.toString(),
        "password": password,
      },
    );
    var response = ChangePasswordResponseModel.fromJson(jsonData);
    return response;
  }

  //********************** edit profile data api call **********************//

  Future<VideoAddResponsemodel> editProfileAPICall({
    required cid,
    required String username,
    required String email,
    required  mobile,
    required  telegramno,
    required  whatsapp,
    required String experience,
    required String image,
    required String gender,
    required String city,
    required String country,
  }) async {
    var jsonData = await apiManager.postAPICall(
      url: '${baseUrl}user/edit-user/$cid',
      params: {
        "username": username,
        "email": email,
        "mobile": mobile,
        "telegramno": telegramno,
        "whatsapp": whatsapp,
        "image": image,
        "gender": gender,
        "experience": experience,
        "city": city,
        "country": country
      },
    );
    var response = VideoAddResponsemodel.fromJson(jsonData);
    return response;
  }


}
