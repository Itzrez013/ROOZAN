import 'package:flutter/material.dart';

import 'pages/details_page.dart';
import 'pages/name_page.dart';
import 'pages/welcome_page.dart';
import 'widgets/onboarding_navigation_buttons.dart';
import 'widgets/onboarding_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({required this.onComplete, super.key});

  final Future<void> Function(String userName) onComplete;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const _pageCount = 3;
  final _pageController = PageController();
  final _nameController = TextEditingController();
  final _nameFormKey = GlobalKey<FormState>();

  int _currentPage = 0;
  bool _isSaving = false;

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _continue() async {
    if (_currentPage == 1 &&
        !(_nameFormKey.currentState?.validate() ?? false)) {
      return;
    }

    if (_currentPage < _pageCount - 1) {
      await _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return;
    }

    setState(() => _isSaving = true);
    try {
      await widget.onComplete(_nameController.text.trim());
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  Future<void> _goBack() async {
    if (_currentPage > 0) {
      await _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            child: Column(
              children: [
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (page) =>
                          setState(() => _currentPage = page),
                      children: [
                        const WelcomePage(),
                        NamePage(
                          controller: _nameController,
                          formKey: _nameFormKey,
                          onSubmitted: _continue,
                        ),
                        const DetailsPage(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                OnboardingPageIndicator(
                  currentPage: _currentPage,
                  pageCount: _pageCount,
                ),
                const SizedBox(height: 24),
                OnboardingNavigationButtons(
                  currentPage: _currentPage,
                  pageCount: _pageCount,
                  isSaving: _isSaving,
                  onBack: _goBack,
                  onContinue: _continue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
