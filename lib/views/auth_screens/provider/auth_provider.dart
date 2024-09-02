import 'dart:developer';

import 'package:farm_loan_app/connection/request_handler.dart';
import 'package:farm_loan_app/data/secure_storage.dart';
import 'package:farm_loan_app/data/shared_pref_helper.dart';
import 'package:farm_loan_app/routes/app_routes.dart';
import 'package:farm_loan_app/routes/custom_router.dart';
import 'package:farm_loan_app/tools/toaster.dart';
import 'package:farm_loan_app/views/auth_screens/model/authModel.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool loading = false;
  String token = '';
  AuthModel? userData;

  void updateUserData(AuthModel data) {
    userData = data;
    notifyListeners();
  }

  void login(context, Map<String, dynamic> data, Function callBack) async {
    callBack(true);
    final request = await RequestHandler.handleApiRequest(context,
        link: '/user/login', type: 'post', callBody: {...data});
    callBack(false);
    var response = request?.data;

    log('login data ${response}');

    if (response['success'] == true) {
      saveUser('email', data['email']);
      SharedPrefsHelper.saveValue('token', response['token']);
      SharedPrefsHelper.saveValue('email', data['email']);
      userData = AuthModel.fromJson(response['data']);
      CustomRouters.routePushWithName(context, AppRouter.dashboard);
      //  box.put('token', userData.token);
    } else {
      NotificationClass.showFailedToast(context, "Error", response['message']);
    }
  }

  void register(context, Map<String, dynamic> data, Function callBack) async {
    callBack(true);
    final request = await RequestHandler.handleApiRequest(context,
        link: '/user/register', type: 'post', callBody: {...data});
    callBack(false);
    var response = request?.data;
    log('response $response');
    if (response['success'] == true) {
      saveUser('email', data['email']);
      SharedPrefsHelper.saveValue('token', response['token']);
      SharedPrefsHelper.saveValue('email', data['email']);
      userData = AuthModel.fromJson(response['data']);
      CustomRouters.routePushWithName(context, AppRouter.dashboard);
      //  box.put('token', userData.token);
    } else {
      NotificationClass.showFailedToast(context, "Error", response['message']);
    }
  }

  void getProfile(context) async {
    final request = await RequestHandler.handleApiRequest(context,
        link: '/user/user-profile', type: 'get', callBody: {});
    var response = request?.data;
    if (response['success'] == true) {
      userData = AuthModel.fromJson(response['data']);
      notifyListeners();
      // CustomRouters.routePop(context);
    } else {
      log('get wallet');
      // NotificationClass.showFailedToast(context, 'Error', response['message']);
    }
  }
}
