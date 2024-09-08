// import 'dart:developer';

// import 'package:farm_loan_app/connection/request_handler.dart';
// import 'package:flutter/material.dart';

// class AccountProvider extends ChangeNotifier {
//   void update_profile(
//       context, Map<String, dynamic> data, Function callBack) async {
//     callBack(true);
//     final request = await RequestHandler.handleApiRequest(context,
//         link: '/user/login', type: 'post', callBody: {...data});
//     callBack(false);
//     var response = request?.data;

//     log('login data ${response}');

//     if (response['success'] == true) {
      
//       CustomRouters.routePushWithName(context, AppRouter.dashboard);
//       //  box.put('token', userData.token);
//     } else {
//       NotificationClass.showFailedToast(context, "Error", response['message']);
//     }
//   }
// }
