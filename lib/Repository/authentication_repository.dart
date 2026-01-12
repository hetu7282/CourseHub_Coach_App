// ignore_for_file: unused_local_variable

import 'package:coach_app/Data/Model/login_response_model.dart';
import 'package:coach_app/Data/Model/current_user_response_model.dart';
import 'package:get_storage/get_storage.dart';

import '../Data/Api/api_manager.dart';
import '../Data/Api/post_api_manager.dart';
import '../Utils/string_constant.dart';

class AuthenticationRepository {
  final APIManager apiManager;
  final PostAPIManager postAPIManager;

  AuthenticationRepository(this.apiManager, this.postAPIManager);

  //********************** current user api call **********************//

  Future<CurrentUserResponseModel> currentUserApiCall() async {
    var jsonData = await postAPIManager.postAPICall(isLoaderShow: false,
      url: '${baseUrl}coach/current-user',
      params: {
        "email": LoginResponseModel.fromJson(
          GetStorage().read(
            userData,
          ),
        ).userdata!.email.toString(),
      },
    );

    var response = CurrentUserResponseModel.fromJson(jsonData);
    return response;
  }

  //********************** login api call **********************//

  Future<LoginResponseModel> loginApiCall({
    required String email,
    required String password,
  }) async {
    var jsonData = await apiManager.postAPICall(
      url: '${baseUrl}coach/login',
      params: {
        "email": email,
        "password": password,
      },
    );

    var response = LoginResponseModel.fromJson(jsonData);
    return response;
  }

  //********************** signUp api call **********************//

  Future<LoginResponseModel> registerApiCall(
      {required String username,
      required String email,
      required String mobileno,
      required String teleno,
      required String password,
      required String whatsno,
      required String image,
      required String gender,
      required String city,
      required String country,
      required String experience,
      required String role}) async {
    var jsonData =
        await apiManager.postAPICall(url: '${baseUrl}coach/register', params: {
      "username": username,
      "email": email,
      "password": password,
      "mobile": mobileno,
      "telegramno": teleno,
      "whatsapp": whatsno,
      "gender": gender,
      "city": city,
      "country": country,
      "experience": experience,
      "image": image,
      "role": role
    });
    var response = LoginResponseModel.fromJson(jsonData);
    return response;
  }

}
