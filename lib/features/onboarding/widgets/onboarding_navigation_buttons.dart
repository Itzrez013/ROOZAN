import 'package:flutter/material.dart';

class OnboardingNavigationButtons extends StatelessWidget {
  const OnboardingNavigationButtons({
    required this.currentPage,
    required this.pageCount,
    required this.isSaving,
    required this.onBack,
    required this.onContinue,
    super.key,
  });

  final int currentPage;
  final int pageCount;
  final bool isSaving;
  final VoidCallback onBack;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        children: [
          if (currentPage > 0)
            TextButton(
              onPressed: isSaving ? null : onBack,
              child: const Text('قبلی'),
            )
          else
            const SizedBox(width: 64),
          const Spacer(),
          FilledButton(
            onPressed: isSaving ? null : onContinue,
            child: isSaving
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(currentPage == pageCount - 1 ? 'شروع کنیم' : 'ادامه'),
          ),
        ],
      ),
    );
  }
}
