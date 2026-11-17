import 'package:flutter/material.dart';

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
    final theme = Theme.of(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (page) =>
                        setState(() => _currentPage = page),
                    children: [
                      _OnboardingPage(
                        title: 'روزان؛ همراه برنامه‌های روزانه شما',
                        description:
                            'روزان فضایی ساده برای برنامه‌ریزی کارها و ثبت '
                            'هدف‌هایی است که می‌خواهید هر روز دنبال کنید.',
                      ),
                      _OnboardingPage(
                        title: 'دوست داریم شما را بشناسیم',
                        description:
                            'نامتان را بنویسید تا روزان با نام خودتان به شما '
                            'خوش‌آمد بگوید.',
                        child: Form(
                          key: _nameFormKey,
                          child: TextFormField(
                            controller: _nameController,
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
                            onFieldSubmitted: (_) => _continue(),
                          ),
                        ),
                      ),
                      _OnboardingPage(
                        title: 'برنامه‌ریزی، به سبک خودتان',
                        description:
                            'کارها و برنامه‌هایتان را در یک جا سامان دهید، '
                            'برای زمان انجامشان یادآور بگذارید و با خیال راحت '
                            'از روزتان لذت ببرید. اطلاعات شما روی همین دستگاه '
                            'ذخیره می‌شود و برای استفاده از روزان به اینترنت '
                            'نیازی ندارید.',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pageCount,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: index == _currentPage ? 24 : 8,
                      decoration: BoxDecoration(
                        color: index == _currentPage
                            ? theme.colorScheme.primary
                            : theme.colorScheme.secondary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    if (_currentPage > 0)
                      TextButton(
                        onPressed: _isSaving ? null : _goBack,
                        child: const Text('قبلی'),
                      )
                    else
                      const SizedBox(width: 64),
                    const Spacer(),
                    FilledButton(
                      onPressed: _isSaving ? null : _continue,
                      child: _isSaving
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(
                              _currentPage == _pageCount - 1
                                  ? 'شروع کنیم'
                                  : 'ادامه',
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({
    required this.title,
    required this.description,
    this.child,
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
