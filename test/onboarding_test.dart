import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:roozan/core/storage/app_preferences.dart';
import 'package:roozan/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await AppPreferences.init();
  });

  testWidgets('requires a name and persists onboarding when completed', (
    tester,
  ) async {
    await tester.pumpWidget(const RoozanApp());

    expect(find.text('روزان؛ همراه برنامه‌های روزانه شما'), findsOneWidget);

    await tester.tap(find.text('ادامه'));
    await tester.pumpAndSettle();
    expect(find.text('دوست داریم شما را بشناسیم'), findsOneWidget);

    await tester.tap(find.text('ادامه'));
    await tester.pumpAndSettle();
    expect(find.text('لطفاً نامتان را وارد کنید'), findsOneWidget);
    expect(AppPreferences.onboardingCompleted, isFalse);

    await tester.enterText(find.byType(TextFormField), 'نازنین');
    await tester.tap(find.text('ادامه'));
    await tester.pumpAndSettle();
    expect(find.text('برنامه‌ریزی، به سبک خودتان'), findsOneWidget);

    await tester.tap(find.text('شروع کنیم'));
    await tester.pumpAndSettle();

    expect(AppPreferences.userName, 'نازنین');
    expect(AppPreferences.onboardingCompleted, isTrue);
    expect(find.text('به روزان خوش آمدید، نازنین!'), findsOneWidget);
  });
}
