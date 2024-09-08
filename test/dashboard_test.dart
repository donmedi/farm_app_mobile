import 'package:farm_loan_app/views/auth_screens/provider/auth_provider.dart';
import 'package:farm_loan_app/views/dashboard/dashboard.dart';
import 'package:farm_loan_app/views/dashboard/services/dashboard_services.dart';
import 'package:farm_loan_app/views/auth_screens/model/authModel.dart';
import 'package:farm_loan_app/views/dashboard/widget/histroy_widget.dart';
import 'package:farm_loan_app/views/repayment_screen/model/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('DahsboardScreen UI test', (WidgetTester tester) async {
    // Mock the AuthProvider and DashboardServices
    final mockAuthProvider = AuthProvider();
    final mockDashboardServices = DashboardServices();

    // Provide mock data for the test
    mockAuthProvider.userData = AuthModel(
      firstName: 'John',
      wallet: Wallet(balance: '5000.0'),
    );
    mockDashboardServices.histories = [
      HistoryModel(amount: '1000', description: 'Loan Repayment'),
      HistoryModel(amount: '2000', description: 'Loan Request'),
    ];

    // Build the widget with mock providers
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>.value(value: mockAuthProvider),
          ChangeNotifierProvider<DashboardServices>.value(
              value: mockDashboardServices),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: DahsboardScreen(),
          ),
        ),
      ),
    );

    // Verify the greeting message and user's name
    expect(find.text('Hello, John'), findsOneWidget);
    expect(find.text('Good Morning'), findsOneWidget);

    // Verify the balance is displayed correctly
    expect(find.text('Overall Balance'), findsOneWidget);
    expect(find.text('NGN 5000.0'), findsOneWidget);

    // Verify that the action buttons (Wallet, Request, Repay) are present
    expect(find.text('Wallet'), findsOneWidget);
    expect(find.text('Request'), findsOneWidget);
    expect(find.text('Repay'), findsOneWidget);

    // Ensure the history widget is present
    expect(find.byType(HistoryWidget), findsOneWidget);

    // Scroll through the history items and verify
    expect(find.text('Loan Repayment'), findsOneWidget);
    expect(find.text('Loan Request'), findsOneWidget);
  });
}
