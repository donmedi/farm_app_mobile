import 'dart:developer';

import 'package:farm_loan_app/connection/request_handler.dart';
import 'package:farm_loan_app/layout/custom_modal.dart';
import 'package:farm_loan_app/routes/custom_router.dart';
import 'package:farm_loan_app/tools/toaster.dart';
import 'package:farm_loan_app/views/auth_screens/model/authModel.dart';
import 'package:farm_loan_app/views/auth_screens/provider/auth_provider.dart';
import 'package:farm_loan_app/views/repayment_screen/model/history_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardServices extends ChangeNotifier {
  String outstandingBal = '0';

  void loanRequest(context, Map data, Function callBack) async {
    callBack(true);

    final request = await RequestHandler.handleApiRequest(context,
        link: '/transaction/create_loan', type: 'post', callBody: {...data});

    callBack(false);
    var response = request?.data;
    if (response['success'] == true) {
      CustomRouters.routePop(context);
      fetchOutstanding(context);
      fetchHistory(context);
      successModalMinimal(context, 'Loan Reqest Successful');
    } else {
      NotificationClass.showFailedToast(context, 'Error', response['message']);
    }
  }

  void withdrawWallet(context, Map data, Function callBack) async {
    callBack(true);

    final request = await RequestHandler.handleApiRequest(context,
        link: '/withdraw/withdraw-funds', type: 'post', callBody: {...data});

    callBack(false);
    var response = request?.data;
    if (response['success'] == true) {
      CustomRouters.routePop(context);
      Provider.of<AuthProvider>(context, listen: false).getProfile(context);
      successModalMinimal(context, 'Withdrawal Successful');
    } else {
      NotificationClass.showFailedToast(context, 'Error', response['message']);
    }
  }

  void fetchOutstanding(context) async {
    final request = await RequestHandler.handleApiRequest(context,
        link: '/transaction/get_outstanding', type: 'get', callBody: {});

    var response = request?.data;
    log('outstanding ${response}');
    if (response['success'] == true) {
      outstandingBal = response['totalOutstanding'].toString();
    } else {
      // NotificationClass.showFailedToast(context, 'Error', response['message']);
    }
  }

  List<HistoryModel> histories = [];

  void fetchHistory(context) async {
    final request = await RequestHandler.handleApiRequest(context,
        link: '/transaction/user-transactions', type: 'get', callBody: {});

    var response = request?.data;
    log('histories ${response['data']}');
    if (response['success'] == true) {
      List data = response['data'];
      histories = data.map((item) => HistoryModel.fromJson(item)).toList();
      notifyListeners();
    } else {
      NotificationClass.showFailedToast(context, 'Error', response['message']);
    }
  }

  List outstandingHistory = [];

  void fetchOutstandingHistory(context) async {
    final request = await RequestHandler.handleApiRequest(context,
        link: '/transaction/get-all-outstanding', type: 'get', callBody: {});

    var response = request?.data;
    log('outstanding histories ${response['data']}');
    if (response['success'] == true) {
      outstandingHistory = response['data'];
      notifyListeners();
    } else {
      NotificationClass.showFailedToast(context, 'Error', response['message']);
    }
  }

  List notifications = [];
  void fetchNotification(context) async {
    final request = await RequestHandler.handleApiRequest(context,
        link: '/notifications/get-all', type: 'get', callBody: {});

    var response = request?.data;
    log('notifications ${response}');
    if (response['success'] == true) {
      notifications = response['data'];
      notifyListeners();
    } else {
      log('notification ${response['message']}');
      // NotificationClass.showFailedToast(context, 'Error', response['message']);
    }
  }
}
