import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import 'src/router/app_router.dart';

void main() {
  runApp(const LearningApp());
}

class LearningApp extends StatelessWidget {
  const LearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'E-Online Learning Platform',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFF8A3C),
          secondary: Color(0xFF9B59B6),
          surface: Color(0xFF2C3E50),
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      ),
      routerConfig: appRouter,
    );
  }
}

class LandingPage extends StatefulWidget {
  final bool scrollToCourses;
  
  const LandingPage({super.key, this.scrollToCourses = false});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _coursesKey = GlobalKey();

  final List<Map<String, dynamic>> courseCategoryCards = [
    {
      'title': 'Flutter\nDevelopment',
      'icon': Icons.phone_android,
      'color': const Color(0xFFE91E63),
    },
    {
      'title': 'Rust\nProgramming',
      'icon': Icons.code,
      'color': const Color(0xFFFF8A3C),
    },
    {
      'title': 'OOP\nConcepts',
      'icon': Icons.design_services,
      'color': const Color(0xFF00BCD4),
    },
    {
      'title': 'Others\nConcepts',
      'icon': Icons.psychology,
      'color': const Color(0xFF9B59B6),
    },
  ];

  @override
  void initState() {
    super.initState();
    // Auto-scroll to courses section if requested
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
      duration: const Duration(milliseconds: 800),
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

  Future<void> _openAboutMeLink() async {
    final url = Uri.parse('https://intishar.xyz');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E2A35),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildNavigation(),
            _buildHeroSection(),
            _buildCourseCategoriesSection(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigation() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 80,
            vertical: 24,
          ),
          child: isMobile
              ? Column(
                  children: [
                    // Logo
                    GestureDetector(
                      onTap: _scrollToTop,
                      child: Text(
                        'E-Online.',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Mobile Navigation
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Center(
                            child: _buildNavLink('Home', _scrollToTop),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: _buildNavLink('Courses', _scrollToCourses),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: _openAboutMeLink,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFF8A3C),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'About Me',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Row(
                  children: [
                    // Logo
                    GestureDetector(
                      onTap: _scrollToTop,
                      child: Text(
                        'E-Online.',
                        style: GoogleFonts.inter(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const Spacer(),

                    // Navigation Links
                    Row(
                      children: [
                        _buildNavLink('Home', _scrollToTop),
                        const SizedBox(width: 40),
                        _buildNavLink('Courses', _scrollToCourses),
                        const SizedBox(width: 40),

                        // About Me Button
                        GestureDetector(
                          onTap: _openAboutMeLink,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF8A3C),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              'About Me',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildNavLink(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white70,
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        final isTablet = constraints.maxWidth < 1024;
        
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
            vertical: isMobile ? 40 : 80,
          ),
          child: isMobile
              ? Column(
                  children: [
                    _buildHeroImage(isMobile: true),
                    const SizedBox(height: 40),
                    _buildHeroText(isMobile: true),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: _buildHeroText(isMobile: false),
                    ),
                    Expanded(
                      flex: 4,
                      child: _buildHeroImage(isMobile: false),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildHeroText({required bool isMobile}) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          text: TextSpan(
            style: GoogleFonts.inter(
              fontSize: isMobile ? 32 : 56,
              fontWeight: FontWeight.w700,
              height: 1.1,
            ),
            children: const [
              TextSpan(
                text: 'Investing in\nKnowledge and\n',
                style: TextStyle(color: Colors.white),
              ),
              TextSpan(
                text: 'Your Future',
                style: TextStyle(color: Color(0xFF9B59B6)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          isMobile 
              ? 'Our e-learning programs deliver multimedia learning solutions for your business.'
              : 'Our e-learning programs has been developed to be a vehicle\nof delivering multimedia learning solutions for your business.',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 16 : 18,
            fontWeight: FontWeight.w400,
            color: Colors.white70,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 40),
        isMobile
            ? Column(
                children: [
                  GestureDetector(
                    onTap: _scrollToCourses,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF8A3C),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        'Start Learning',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Comprehensive',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Career Courses',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Growing',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Community',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                children: [
                  GestureDetector(
                    onTap: _scrollToCourses,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF8A3C),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        'Start Learning',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Comprehensive',
                        style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Career Courses',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Growing',
                        style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Community',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ],
    );
  }

  Widget _buildHeroImage({required bool isMobile}) {
    final imageSize = isMobile ? 250.0 : 500.0;
    
    return Stack(
      children: [
        Center(
          child: Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF8A3C).withValues(alpha: 0.3),
                  blurRadius: isMobile ? 20 : 40,
                  spreadRadius: isMobile ? 5 : 10,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/gifs/programmer.gif',
                fit: BoxFit.cover,
                width: imageSize,
                height: imageSize,
              ),
            ),
          ),
        ),
        if (!isMobile) ...[
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF2C3E50),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color(0xFFFF8A3C),
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.asset(
                  'assets/gifs/loading.gif',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: 80,
            child: Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                color: Color(0xFFFF8A3C),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 40,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF2C3E50),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF8A3C),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.people,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Active',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Learning Hub',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF2C3E50),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Learning Chart',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildChartBar(0.3, const Color(0xFFE91E63)),
                      _buildChartBar(0.7, const Color(0xFFE91E63)),
                      _buildChartBar(0.4, const Color(0xFF00BCD4)),
                      _buildChartBar(0.8, const Color(0xFFFF8A3C)),
                      _buildChartBar(1.0, const Color(0xFF9B59B6)),
                      _buildChartBar(0.6, const Color(0xFF4CAF50)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildChartBar(double height, Color color) {
    return Container(
      width: 12,
      height: 60 * height,
      margin: const EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildCourseCategoriesSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        final isTablet = constraints.maxWidth < 1024;
        
        return Container(
          key: _coursesKey,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
            vertical: isMobile ? 40 : 60,
          ),
          child: Column(
            crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              Text(
                'Essential\nCareer Courses',
                textAlign: isMobile ? TextAlign.center : TextAlign.start,
                style: GoogleFonts.inter(
                  fontSize: isMobile ? 28 : 42,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              SizedBox(height: isMobile ? 40 : 60),
              isMobile
                  ? Column(
                      children: [
                        _buildCategoryCard(
                          'Flutter\nDevelopment',
                          Icons.phone_android,
                          const Color(0xFFE91E63),
                          '/flutter',
                          isMobile: true,
                        ),
                        const SizedBox(height: 16),
                        _buildCategoryCard(
                          'Rust\nProgramming',
                          Icons.code,
                          const Color(0xFFFF8A3C),
                          '/rust',
                          isMobile: true,
                        ),
                        const SizedBox(height: 16),
                        _buildCategoryCard(
                          'OOP\nConcepts',
                          Icons.design_services,
                          const Color(0xFF00BCD4),
                          '/oop',
                          isMobile: true,
                        ),
                        const SizedBox(height: 16),
                        _buildCategoryCard(
                          'Others\nConcepts',
                          Icons.psychology,
                          const Color(0xFF9B59B6),
                          '/others',
                          isMobile: true,
                        ),
                      ],
                    )
                  : isTablet
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: _buildCategoryCard(
                                    'Flutter\nDevelopment',
                                    Icons.phone_android,
                                    const Color(0xFFE91E63),
                                    '/flutter',
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildCategoryCard(
                                    'Rust\nProgramming',
                                    Icons.code,
                                    const Color(0xFFFF8A3C),
                                    '/rust',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildCategoryCard(
                                    'OOP\nConcepts',
                                    Icons.design_services,
                                    const Color(0xFF00BCD4),
                                    '/oop',
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildCategoryCard(
                                    'Others\nConcepts',
                                    Icons.psychology,
                                    const Color(0xFF9B59B6),
                                    '/others',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                              child: _buildCategoryCard(
                                'Flutter\nDevelopment',
                                Icons.phone_android,
                                const Color(0xFFE91E63),
                                '/flutter',
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: _buildCategoryCard(
                                'Rust\nProgramming',
                                Icons.code,
                                const Color(0xFFFF8A3C),
                                '/rust',
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: _buildCategoryCard(
                                'OOP\nConcepts',
                                Icons.design_services,
                                const Color(0xFF00BCD4),
                                '/oop',
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: _buildCategoryCard(
                                'Others\nConcepts',
                                Icons.psychology,
                                const Color(0xFF9B59B6),
                                '/others',
                              ),
                            ),
                          ],
                        ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCategoryCard(String title, IconData icon, Color color, String route, {bool isMobile = false}) {
    return GestureDetector(
      onTap: () => context.go(route),
      child: Container(
        height: isMobile ? 120 : 200,
        width: isMobile ? double.infinity : null,
        padding: EdgeInsets.all(isMobile ? 20 : 32),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(isMobile ? 16 : 24),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.3),
              blurRadius: isMobile ? 10 : 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: isMobile
            ? Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 32,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 48,
                  ),
                  const Spacer(),
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildFooter() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF1E2A35),
                Color(0xFF111113),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 80,
              vertical: isMobile ? 32 : 48,
            ),
            child: Column(
              children: [
                // Footer Content
                isMobile
                    ? Column(
                        children: [
                          _buildFooterBrand(isMobile: true),
                          const SizedBox(height: 32),
                          _buildSocialLinks(isMobile: true),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildFooterBrand(),
                          _buildSocialLinks(),
                        ],
                      ),
                
                const SizedBox(height: 32),
                
                // Divider
                Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        const Color(0xFFFF8A3C).withValues(alpha: 0.3),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Copyright
                Column(
                  children: [
                    Text(
                      '© ${DateTime.now().year} ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: Colors.white60,
                        fontSize: isMobile ? 12 : 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Color(0xFFFF8A3C), Color(0xFF9B59B6)],
                      ).createShader(bounds),
                      child: Text(
                        'Intishar-Ul Islam',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: isMobile ? 12 : 14,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Text(
                      '. All rights reserved.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: Colors.white60,
                        fontSize: isMobile ? 12 : 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFooterBrand({bool isMobile = false}) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Logo and Name
        Row(
          mainAxisSize: isMobile ? MainAxisSize.min : MainAxisSize.max,
          children: [
            Container(
              width: isMobile ? 40 : 48,
              height: isMobile ? 40 : 48,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF8A3C), Color(0xFF9B59B6)],
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF8A3C).withValues(alpha: 0.3),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'E',
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFFFF8A3C), Color(0xFF9B59B6)],
                  ).createShader(bounds),
                  child: Text(
                    'E-Online',
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 20 : 24,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'Learning Platform',
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 12 : 14,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Tagline
        Text(
          'Building knowledge through comprehensive programming courses\nwith expert-led content and hands-on learning.',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 12 : 14,
            color: Colors.white60,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLinks({bool isMobile = false}) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Connect With Me',
          style: GoogleFonts.inter(
            fontSize: isMobile ? 16 : 18,
            color: Colors.white,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 16),
        isMobile
            ? Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildSocialLink(
                    Icons.code,
                    'https://github.com/Nahianether/',
                    'GitHub',
                    const Color(0xFF333333),
                  ),
                  _buildSocialLink(
                    Icons.business,
                    'https://www.linkedin.com/in/nahinxp21/',
                    'LinkedIn',
                    const Color(0xFF0077B5),
                  ),
                  _buildSocialLink(
                    Icons.mail,
                    'mailto:nahianether3@gmail.com',
                    'Gmail',
                    const Color(0xFFEA4335),
                  ),
                  _buildSocialLink(
                    Icons.language,
                    'https://intishar.xyz',
                    'Portfolio',
                    const Color(0xFF9B59B6),
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildSocialLink(
                    Icons.code,
                    'https://github.com/Nahianether/',
                    'GitHub',
                    const Color(0xFF333333),
                  ),
                  const SizedBox(width: 16),
                  _buildSocialLink(
                    Icons.business,
                    'https://www.linkedin.com/in/nahinxp21/',
                    'LinkedIn',
                    const Color(0xFF0077B5),
                  ),
                  const SizedBox(width: 16),
                  _buildSocialLink(
                    Icons.mail,
                    'mailto:nahianether3@gmail.com',
                    'Gmail',
                    const Color(0xFFEA4335),
                  ),
                  const SizedBox(width: 16),
                  _buildSocialLink(
                    Icons.language,
                    'https://intishar.xyz',
                    'Portfolio',
                    const Color(0xFF9B59B6),
                  ),
                ],
              ),
      ],
    );
  }

  Widget _buildSocialLink(IconData icon, String url, String tooltip, Color color) {
    String displayUrl = url;
    if (url.startsWith('mailto:')) {
      displayUrl = url.substring(7); // Remove 'mailto:' prefix
    } else if (url.startsWith('https://')) {
      displayUrl = url.substring(8); // Remove 'https://' prefix
    }

    return Tooltip(
      message: '$tooltip\n$displayUrl',
      textStyle: GoogleFonts.inter(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF2C3E50),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color.withValues(alpha: 0.5),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      preferBelow: false,
      verticalOffset: 16,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => _launchURL(url),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF2C3E50),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: color.withValues(alpha: 0.3),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 24,
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
