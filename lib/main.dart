import 'package:farm_loan_app/routes/app_routes.dart';
import 'package:farm_loan_app/themes/theme_type.dart';
import 'package:farm_loan_app/views/auth_screens/provider/auth_provider.dart';
import 'package:farm_loan_app/views/dashboard/services/dashboard_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

late Box box;
void main() async {
  await Hive.initFlutter();
  box = await Hive.openBox('box');
  box.put('token', '');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => DashboardServices())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(440, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) => ToastificationWrapper(
            child: MaterialApp(
                title: 'Farm Loan App',
                debugShowCheckedModeBanner: false,
                navigatorKey: AppRouter.navigatorKey,
                onGenerateRoute: AppRouter.generateRoute,
                initialRoute: '/welcome',
                theme: ThemeType.light)));
  }
}
