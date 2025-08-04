import 'package:flutter/material.dart';
import '../../../core/models/app_constants.dart';
import '../widgets/hero_section.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/course_categories_section.dart';
import '../widgets/footer_section.dart';

class LandingPage extends StatefulWidget {
  final bool scrollToCourses;
  
  const LandingPage({super.key, this.scrollToCourses = false});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _coursesKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    if (widget.scrollToCourses) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToCourses();
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: AppConstants.longAnimation,
      curve: Curves.easeInOut,
    );
  }

  void _scrollToCourses() {
    final context = _coursesKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 1500),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            CustomNavigationBar(
              onScrollToTop: _scrollToTop,
              onScrollToCourses: _scrollToCourses,
            ),
            const HeroSection(),
            CourseCategoriesSection(key: _coursesKey),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}