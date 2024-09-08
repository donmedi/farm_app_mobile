import 'package:farm_loan_app/main.dart'; // Your main file
import 'package:farm_loan_app/routes/app_routes.dart';
import 'package:farm_loan_app/themes/theme_type.dart';
import 'package:farm_loan_app/views/auth_screens/provider/auth_provider.dart';
import 'package:farm_loan_app/views/dashboard/services/dashboard_services.dart';
import 'package:farm_loan_app/views/repayment_screen/services/repayment_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Farm Loan App initial setup test', (WidgetTester tester) async {
    // Build the app and trigger a frame
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => DashboardServices()),
          ChangeNotifierProvider(create: (_) => RepaymentService()),
        ],
        child: const MyApp(),
      ),
    );

    // Ensure the app starts with the correct initial route
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('Farm Loan App'), findsNothing);

    // Check the correct initial route
    expect(AppRouter.navigatorKey.currentState?.canPop(), false);
    expect(AppRouter.welcome, '/welcome');

    // Check the theme
    final MaterialApp materialApp = tester.widget(find.byType(MaterialApp));
    expect(materialApp.theme, ThemeType.light);
  });
}
