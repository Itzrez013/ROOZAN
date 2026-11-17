import 'package:flutter/material.dart';

import '../widgets/onboarding_page_layout.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingPageLayout(
      title: 'روزان؛ همراه برنامه‌های روزانه شما',
      description:
          'روزان فضایی ساده برای برنامه‌ریزی کارها و ثبت '
          'هدف‌هایی است که می‌خواهید هر روز دنبال کنید.',
    );
  }
}
