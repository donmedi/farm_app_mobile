import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:farm_loan_app/constant/constant.dart';
import 'package:farm_loan_app/data/shared_pref_helper.dart';
import 'package:farm_loan_app/routes/app_routes.dart';
import 'package:farm_loan_app/routes/custom_router.dart';
import 'package:farm_loan_app/tools/toaster.dart';
import 'package:flutter/material.dart';

import '../layout/custom_modal.dart';

// https://websim.sdk.monnify.com/?#/bankingapp

String apiUrl = Constant.apiMainUrl;

class RequestHandler {
  static String apiMainUrl = apiUrl;

  static const String userData = 'userData';
  static const String phoneNumber = 'phoneNumber';

  static get box => null;

  static Future<Response?> handleApiRequest(
    context, {
    required String link,
    required String type,
    required Map<String, dynamic> callBody,
  }) async {
    var dio = Dio();

    String token = await SharedPrefsHelper.getValue('token') ?? '';
    // String token = '';

    try {
      var url = RequestHandler.apiMainUrl + link;
      log('url $url body $callBody');
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';

      final response = type == 'get'
          ? await dio.get(url)
          : type == 'post'
              ? await dio.post(url, data: jsonEncode(callBody))
              : type == 'put'
                  ? await dio.put(url, data: jsonEncode(callBody))
                  : type == 'delete'
                      ? await dio.delete(url, data: jsonEncode(callBody))
                      : type == 'patch'
                          ? await dio.patch(url, data: jsonEncode(callBody))
                          : await null;

      var jsonResult = await response?.data;
      // log('response ${jsonResult} body $callBody');
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        NotificationClass.showFailedToast(
            context, 'Error', 'Network error check internet');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        NotificationClass.showFailedToast(
            context, 'Error', 'Network error check internet');
      } else if (e.response != null) {
        if (e.response?.statusCode == 401) {
          NotificationClass.showFailedToast(context, 'Error',
              e.response?.data?['message'].toString() ?? 'Network error');
        } else if (e.response?.statusCode == 403) {
          CustomRouters.routePushWithNameReplace(context, AppRouter.login);
          NotificationClass.showFailedToast(context, 'Error',
              e.response?.data?['message'].toString() ?? 'Network error');
        }
      }

      return e.response;
    } catch (e) {
      log('$e');
    }
  }

  static void formDataRequest(
    context, {
    required String link,
    required String type,
    required FormData callBody,
    required Function callBack,
    required Function updateLoading,
  }) async {
    var dio = Dio();

    String token = box.get('token') ?? '';

    try {
      updateLoading(true);
      var url = RequestHandler.apiMainUrl + link;
      log('url $url');
      dio.options.headers['content-Type'] = 'multipart/form-data';
      dio.options.headers['Accept'] = "*/*";
      dio.options.headers['Authorization'] = 'Bearer $token';
      // log('${callBody.fields[1]}');

      // callBody.fields.forEach((field) {
      //   log('this is sent ${field.key}: ${field.value}  ${field.value.runtimeType}');
      // });

      var response = type == 'post'
          ? await dio.post(url, data: callBody)
          : await dio.patch(url, data: callBody);

      var jsonResult = await response.data;

      if (response.statusCode == 200 || response.statusCode == 201) {
        updateLoading(false);
        callBack(jsonResult);
      } else {
        NotificationClass.showFailedToast(
            context, 'Error', jsonResult['message'] ?? 'Error not found');
        updateLoading(false);
      }
    } on DioException catch (e) {
      updateLoading(false);
      log('all error ${e.response?.data}');
      if (e.type == DioExceptionType.connectionTimeout) {
        // errorModal(context, 'Network error check internet');
        NotificationClass.showFailedToast(
            context, 'Error', 'Network error check internet');
        // throw Exception("Connection  Timeout Exception");
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorModal(context, 'Network error check internet');
        NotificationClass.showFailedToast(
            context, 'Error', 'Network error check internet');
        // throw Exception("Recieve Timeout Exception");
      } else if (e.response != null) {
        if (e.response?.statusCode == 401) {
          NotificationClass.showFailedToast(context, 'Error',
              e.response?.data?['message'].toString() ?? 'Network error');
        } else if (e.response?.statusCode == 403) {
          CustomRouters.routePushWithNamedRemove(context, AppRouter.login);
          NotificationClass.showFailedToast(context, 'Error',
              e.response?.data?['message'].toString() ?? 'Session Timeout');
        } else {
          // callBack(e.response?.data);
          NotificationClass.showFailedToast(context, 'Error',
              e.response?.data?['message'].toString() ?? 'Network error');
        }
      } else {
        NotificationClass.showFailedToast(context, 'Error',
            e.response?.data?['message'].toString() ?? 'Network error');
        log('message');
      }
    } catch (e) {
      updateLoading(false);
      log('error 404 $e');
      NotificationClass.showFailedToast(context, 'Error', 'Network error');
    }
  }
}

class ApiResponse {
  dynamic data;
  int statusCode;
  String message;

  ApiResponse(
      {required this.data, required this.message, required this.statusCode});
}

class ErrorResponse {
  int statusCode;
  String message;

  ErrorResponse({required this.message, required this.statusCode});
}



 // static void handleRequest(context,
  //     {required String link,
  //     required String type,
  //     required Map<String, dynamic> callBody,
  //     required Function callBack,
  //     required Function updateLoading}) async {
  //   var dio = Dio();
  //   // log('callbody ${callBody}');
  //   String token = box.get('token') ?? '';

  //   try {
  //     updateLoading(true);

  //     var url = RequestHandler.apiMainUrl + link;

  //     log('url $url body $callBody');

  //     dio.options.headers['content-Type'] = 'application/json';
  //     dio.options.headers['Accept'] = 'application/json';
  //     dio.options.headers['Authorization'] = 'Bearer $token';

  //     var response = type == 'get'
  //         ? await dio.get(url)
  //         : type == 'post'
  //             ? await dio.post(url, data: jsonEncode(callBody))
  //             : type == 'put'
  //                 ? await dio.put(url, data: jsonEncode(callBody))
  //                 : type == 'delete'
  //                     ? await dio.delete(url, data: jsonEncode(callBody))
  //                     : type == 'patch'
  //                         ? await dio.patch(url, data: jsonEncode(callBody))
  //                         : await null;

  //     // dio.options.connectTimeout = 60000; //5s
  //     // dio.options.receiveTimeout = 60000;

  //     // var response = await dio.get(url);

  //     var jsonResult = await response?.data;

  //     // log('jsonResult $jsonResult');

  //     if (response?.statusCode == 200 || response?.statusCode == 201) {
  //       updateLoading(false);
  //       callBack(jsonResult);
  //     } else {
  //       NotificationClass.showFailedToast(
  //           context, 'Error', jsonResult['message'] ?? 'Error not found');
  //       updateLoading(false);
  //     }
  //   } on DioException catch (e) {
  //     updateLoading(false);
  //     log('error log ${e.message}');
  //     // log('all error ${e.response?.data}');
  //     if (e.type == DioExceptionType.connectionTimeout) {
  //       // errorModal(context, 'Network error check internet');
  //       NotificationClass.showFailedToast(
  //           context, 'Error', 'Network error check internet');
  //       // throw Exception("Connection  Timeout Exception");
  //     } else if (e.type == DioExceptionType.receiveTimeout) {
  //       errorModal(context, 'Network error check internet');
  //       NotificationClass.showFailedToast(
  //           context, 'Error', 'Network error check internet');
  //       // throw Exception("Recieve Timeout Exception");
  //     } else if (e.response != null) {
  //       if (e.response?.statusCode == 401) {
  //         NotificationClass.showFailedToast(context, 'Error',
  //             e.response?.data?['message'].toString() ?? 'Network error');
  //       } else if (e.response?.statusCode == 403) {
  //         CustomRouters.routePushWithNameReplace(context, AppRouter.login);
  //         NotificationClass.showFailedToast(context, 'Error',
  //             e.response?.data?['message'].toString() ?? 'Network error');
  //       } else {
  //         // callBack(e.response?.data);
  //         NotificationClass.showFailedToast(context, 'Error',
  //             e.response?.data?['message'].toString() ?? 'Network error');
  //       }
  //     } else {
  //       NotificationClass.showFailedToast(context, 'Error',
  //           e.response?.data?['message'].toString() ?? 'Network error');
  //       log('message ${e.toString()}');
  //     }
  //   } catch (e) {
  //     updateLoading(false);
  //     log('error 404 $e');
  //     // NotificationClass.showFailedToast(context, 'Error', 'Network error');
  //   }
  // }