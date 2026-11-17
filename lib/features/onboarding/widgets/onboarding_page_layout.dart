import 'package:flutter/material.dart';

class OnboardingPageLayout extends StatelessWidget {
  const OnboardingPageLayout({
    required this.title,
    required this.description,
    this.child,
    super.key,
  });

  final String title;
  final String description;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.sizeOf(context).height * 0.65,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/ROOZAN.png',
              height: 160,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 32),
            Text(
              title,
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge,
            ),
            if (child != null) ...[const SizedBox(height: 28), child!],
          ],
        ),
      ),
    );
  }
}
