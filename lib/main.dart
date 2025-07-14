import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// Riverpod provider for selected category
final selectedCategoryProvider = StateProvider<String>((ref) => 'All');

void main() {
  runApp(const ProviderScope(child: LearningApp()));
}

class LearningApp extends StatelessWidget {
  const LearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const LandingPage(),
    );
  }
}

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  ConsumerState<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {
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
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
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
          ],
        ),
      ),
    );
  }

  Widget _buildNavigation() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 24),
      child: Row(
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      child: Row(
        children: [
          // Left Side - Text Content
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.inter(
                      fontSize: 56,
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
                  'Our e-learning programs has been developed to be a vehicle\nof delivering multimedia learning solutions for your business.',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    // Contact Button
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
                    
                    // Stats
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
            ),
          ),

          // Right Side - Illustration Area
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                // Main programmer GIF
                Center(
                  child: Container(
                    width: 500,
                    height: 500,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFF8A3C).withValues(alpha: 0.3),
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/gifs/programmer.gif',
                        fit: BoxFit.cover,
                        width: 500,
                        height: 500,
                      ),
                    ),
                  ),
                ),

                // Decorative loading GIF
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

                // Additional decorative element
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

                // Stats card
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

                // Learning chart
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
            ),
          ),
        ],
      ),
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
    return Container(
      key: _coursesKey,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Essential\nCareer Courses',
            style: GoogleFonts.inter(
              fontSize: 42,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 60),
          Row(
            children: [
              Expanded(
                child: _buildCategoryCard(
                  'Flutter\nDevelopment',
                  Icons.phone_android,
                  const Color(0xFFE91E63),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildCategoryCard(
                  'Rust\nProgramming',
                  Icons.code,
                  const Color(0xFFFF8A3C),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildCategoryCard(
                  'OOP\nConcepts',
                  Icons.design_services,
                  const Color(0xFF00BCD4),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildCategoryCard(
                  'Others\nConcepts',
                  Icons.psychology,
                  const Color(0xFF9B59B6),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: _openAboutMeLink,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF8A3C),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon, Color color) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
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
    );
  }
}
