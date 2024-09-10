import 'dart:developer';

import 'package:farm_loan_app/connection/request_handler.dart';
import 'package:farm_loan_app/layout/custom_modal.dart';
import 'package:farm_loan_app/routes/custom_router.dart';
import 'package:farm_loan_app/tools/toaster.dart';
import 'package:farm_loan_app/views/repayment_screen/model/repayment_model.dart';
import 'package:flutter/material.dart';

class RepaymentService extends ChangeNotifier {
  // List repayments;
  String requestId = '';
  List<RepaymentModel> outstandingHistory = [];

  void addRequestId(String id) {
    requestId = id;
    notifyListeners();
  }

  void getRepaymentHistory(context) async {
    final request = await RequestHandler.handleApiRequest(context,
        link: '/transaction/get-all-outstanding', type: 'get', callBody: {});

    var response = request?.data;
    log('outstanding histories ${response['data']}');
    if (response['success'] == true) {
      List list = response['data'];
      outstandingHistory =
          list.map((item) => RepaymentModel.fromJson(item)).toList();
      notifyListeners();
    } else {
      outstandingHistory = [];
      notifyListeners();
      // NotificationClass.showFailedToast(context, 'Error', response['message']);
    }
  }

  void repaymentReq(context, Map data, Function callBack) async {
    callBack(true);

    final request = await RequestHandler.handleApiRequest(context,
        link: '/transaction/repayment', type: 'post', callBody: {...data});

    callBack(false);
    var response = request?.data;
    if (response['success'] == true) {
      getRepaymentHistory(context);
      CustomRouters.routePop(context);
      // CustomRouters.routePop(context);
      CustomRouters.routePop(context);
      successModalMinimal(context, 'Repayment Successful');
    } else {
      log('response data $response');
      NotificationClass.showFailedToast(context, 'Error', response['message']);
    }
  }
}
