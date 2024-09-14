import 'package:farm_loan_app/views/auth_screens/provider/auth_provider.dart';
import 'package:farm_loan_app/views/auth_screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

// Mock classes
class MockAuthProvider extends Mock implements AuthProvider {}

void main() {
  Widget createLoginScreen() {
    return ScreenUtilInit(
        designSize: const Size(440, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) => MaterialApp(
              home: ChangeNotifierProvider(
                create: (_) => MockAuthProvider(),
                child: RegisterScreen(),
              ),
            ));
  }

  testWidgets('should display register texts', (WidgetTester tester) async {
    await tester.pumpWidget(createLoginScreen());
    expect(find.text('Discover an easy way to farm and make money'), findsOne);
    expect(find.text('Register'), findsAny);
    expect(find.text('Firstname'), findsAny);
    expect(find.text('Last Name'), findsAny);
    expect(find.text('Email'), findsAny);
  });
}
