import 'package:flutter/material.dart';

class OnboardingPageIndicator extends StatelessWidget {
  const OnboardingPageIndicator({
    required this.currentPage,
    required this.pageCount,
    super.key,
  });

  final int currentPage;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          pageCount,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 8,
            width: index == currentPage ? 24 : 8,
            decoration: BoxDecoration(
              color: index == currentPage ? colors.primary : colors.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
