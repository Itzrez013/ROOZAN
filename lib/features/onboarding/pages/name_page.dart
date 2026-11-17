import 'package:flutter/material.dart';

import '../widgets/onboarding_page_layout.dart';

class NamePage extends StatelessWidget {
  const NamePage({
    required this.controller,
    required this.formKey,
    required this.onSubmitted,
    super.key,
  });

  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    return OnboardingPageLayout(
      title: 'دوست داریم شما را بشناسیم',
      description:
          'نامتان را بنویسید تا روزان با نام خودتان به شما '
          'خوش‌آمد بگوید.',
      child: Form(
        key: formKey,
        child: TextFormField(
          controller: controller,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
            labelText: 'نام شما',
            hintText: 'مثلاً نازنین',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'لطفاً نامتان را وارد کنید';
            }
            return null;
          },
          onFieldSubmitted: (_) => onSubmitted(),
        ),
      ),
    );
  }
}
