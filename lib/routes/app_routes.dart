import 'package:farm_loan_app/layout/main_bottom_nav.dart';
import 'package:farm_loan_app/views/auth_screens/login_screen.dart';
import 'package:farm_loan_app/views/auth_screens/register_screen.dart';
import 'package:farm_loan_app/views/dashboard/dashboard.dart';
import 'package:farm_loan_app/views/notification/notification_screen.dart';
import 'package:farm_loan_app/views/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const welcome = '/welcome';
  static const login = '/login';
  static const register = '/register';
  static const dashboard = '/dashboard';
  static const transactions = '/transaction';
  static const account = '/account';
  static const notification = '/notification';

  static final navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext? get context => navigatorKey.currentState?.context;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/welcome':
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case '/dashboard':
        return MaterialPageRoute(
            builder: (_) => MainBottomNav(currentIndex: 0));
      case '/transaction':
        return MaterialPageRoute(
            builder: (_) => MainBottomNav(currentIndex: 1));
      case '/account':
        return MaterialPageRoute(
            builder: (_) => MainBottomNav(currentIndex: 1));
      case '/notification':
        return MaterialPageRoute(builder: (_) => NotificationScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SizedBox());
    }
  }
}
