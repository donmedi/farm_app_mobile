import 'dart:developer';

import 'package:farm_loan_app/firebase_options.dart';
import 'package:farm_loan_app/layout/in_app_notification.dart';
import 'package:farm_loan_app/routes/app_routes.dart';
import 'package:farm_loan_app/themes/theme_type.dart';
import 'package:farm_loan_app/views/auth_screens/provider/auth_provider.dart';
import 'package:farm_loan_app/views/dashboard/services/dashboard_services.dart';
import 'package:farm_loan_app/views/repayment_screen/services/repayment_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

late Box box;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  // log("Handling a background message: ${message.messageId}");
}

void main() async {
  await Hive.initFlutter();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: false,
    criticalAlert: true,
    provisional: false,
    sound: true,
  );
  // print('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // log('Got a message whilst in the foreground!');
    // log('Message data: ${message}');
    if (message.notification != null) {
      log('Message also contained a notification: ${message.notification}');
    }
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  messaging.getToken().then((value) {
    String token = value!;
    // _setToken(token);
    log('Token $token');
  });

  box = await Hive.openBox('box');
  box.put('token', '');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => DashboardServices()),
    ChangeNotifierProvider(create: (_) => RepaymentService())
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void _onNewMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null && initialMessage.notification?.title != null) {
      // customNotificationModal(navigatorKey.currentContext, initialMessage);
      // print('Opened app from terminated state: $initialMessage');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onNewMessage();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        showOverlayNotification((context) {
          return InAppNotificationCard(message: message);
        }, duration: const Duration(seconds: 10));
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(440, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) => OverlaySupport.global(
            child: ToastificationWrapper(
                child: MaterialApp(
                    title: 'Farm Loan App',
                    debugShowCheckedModeBanner: false,
                    navigatorKey: AppRouter.navigatorKey,
                    onGenerateRoute: AppRouter.generateRoute,
                    initialRoute: '/welcome',
                    theme: ThemeType.light))));
  }
}
