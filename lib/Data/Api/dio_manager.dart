// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:coach_app/Data/Api/api_exception.dart';
import 'package:coach_app/Utils/constant_widget.dart';
import 'package:dio/dio.dart';

import '../Model/error_model.dart';

class DioManager {
  var authToken1 =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImpAZ21haWwuY29tIiwiaWF0IjoxNjc5Mzc0MjE4fQ.yrhNKbtsCfyuIZj4MBqeCJENu48fT-GWe3f0Voqh06A";

  Dio dio = Dio();

  Future<dynamic> postApiCall(
      {required String url,
      FormData? formData,
      bool isLoaderShow = true}) async {
    dynamic responseJson;
    log("[Calling API] => $url");
    log("[Calling parameters form data] => ${formData!.fields.toString()}");
    log("[Calling parameters form data] => ${formData.files.toString()}");

    try {
      if (isLoaderShow == true) {
        showProgressIndicator();
      }

      final response = await dio.post(url,
          data: formData, options: Options(contentType: 'multipart/form-data'));
      log(response.data.toString());
      responseJson = _response(response);
    } on SocketException {
      errorSnackBar(message: 'Server Down, Please try after some time!');
      throw FetchDataException('No Internet Connection');
    } on TimeoutException catch (_) {
      throw FetchDataException('Server Error');
    } on DioError catch (_) {
      errorSnackBar(message: 'Server Down, Please try after some time!');
    } finally {
      if (isLoaderShow == true) {
        dismissProgressIndicator();
      }
    }
    return responseJson;
  }

  Future<dynamic> patchApiCall(
      {required String url,
      FormData? formData,
      Map<String, dynamic>? headers,
      bool isLoaderShow = true}) async {
    dynamic responseJson;
    log("[Calling API] => $url");
    log("[Calling parameters form data] => ${formData!.fields.toString()}");
    log("[Calling parameters form data] => ${formData.files.toString()}");

    try {
      if (isLoaderShow == true) {
        showProgressIndicator();
      }

      final response = await dio.patch(url,
          data: formData,
          options:
              Options(contentType: 'multipart/form-data', headers: headers));
      log(response.data.toString());
      responseJson = _response(response);
    } on SocketException {
      errorSnackBar(message: 'Server Down, Please try after some time!');
      throw FetchDataException('No Internet Connection');
    } on TimeoutException catch (_) {
      throw FetchDataException('Server Error');
    } on DioError catch (_) {
      errorSnackBar(message: 'Server Down, Please try after some time!');
    } finally {
      if (isLoaderShow == true) {
        dismissProgressIndicator();
      }
    }
    return responseJson;
  }

  dynamic _response(Response response) async {
    switch (response.statusCode) {
      case 200:
        if (ErrorModel.fromJson(response.data).status == 0) {
          errorSnackBar(
            message: ErrorModel.fromJson(response.data).message,
          );
          throw BadRequestException(
            ErrorModel.fromJson(response.data).message,
          );
        } else {
          var responseJson = response.data;
          return responseJson;
        }

      case 400:
        errorSnackBar(
          message: ErrorModel.fromJson(response.data).message,
        );
        throw BadRequestException(
          ErrorModel.fromJson(response.data).message,
        );

      case 403:
        errorSnackBar(
          message: ErrorModel.fromJson(response.data).message,
        );
        throw UnauthorisedException(
          ErrorModel.fromJson(response.data).message,
        );

      case 500:
      default:
        errorSnackBar(
          message: ErrorModel.fromJson(response.data).message,
        );
        throw FetchDataException(
          'An error occured while communication with server with status code: ${response.statusCode}',
        );
    }
  }
}
