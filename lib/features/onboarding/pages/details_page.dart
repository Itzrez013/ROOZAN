import 'package:flutter/material.dart';

import '../widgets/onboarding_page_layout.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingPageLayout(
      title: 'برنامه‌ریزی، به سبک خودتان',
      description:
          'کارها و برنامه‌هایتان را در یک جا سامان دهید، '
          'برای زمان انجامشان یادآور بگذارید و با خیال راحت '
          'از روزتان لذت ببرید. اطلاعات شما روی همین دستگاه '
          'ذخیره می‌شود و برای استفاده از روزان به اینترنت '
          'نیازی ندارید.',
    );
  }
}
