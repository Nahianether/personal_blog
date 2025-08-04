import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/models/app_constants.dart';
import '../../../core/utils/responsive_helper.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ResponsiveHelper.isMobile(context);
        
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveHelper.getHorizontalPadding(context),
            vertical: ResponsiveHelper.getVerticalPadding(context),
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
                style: TextStyle(color: AppConstants.secondaryColor),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          isMobile 
              ? AppConstants.heroSubtitleMobile
              : AppConstants.heroSubtitle,
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
            ? _buildMobileActions()
            : _buildDesktopActions(),
      ],
    );
  }

  Widget _buildMobileActions() {
    return Column(
      children: [
        _buildStartLearningButton(),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    AppConstants.comprehensiveTitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    AppConstants.comprehensiveSubtitle,
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
                    AppConstants.growingTitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    AppConstants.growingSubtitle,
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
    );
  }

  Widget _buildDesktopActions() {
    return Row(
      children: [
        _buildStartLearningButton(),
        const SizedBox(width: 60),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppConstants.comprehensiveTitle,
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              AppConstants.comprehensiveSubtitle,
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
              AppConstants.growingTitle,
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              AppConstants.growingSubtitle,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStartLearningButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        color: AppConstants.primaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        AppConstants.startLearningText,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
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
                  color: AppConstants.primaryColor.withValues(alpha: 0.3),
                  blurRadius: isMobile ? 20 : 40,
                  spreadRadius: isMobile ? 5 : 10,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                AppConstants.programmerGif,
                fit: BoxFit.cover,
                width: imageSize,
                height: imageSize,
              ),
            ),
          ),
        ),
        if (!isMobile) ..._buildFloatingElements(),
      ],
    );
  }

  List<Widget> _buildFloatingElements() {
    return [
      Positioned(
        top: 20,
        right: 20,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppConstants.surfaceColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppConstants.primaryColor,
              width: 2,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image.asset(
              AppConstants.loadingGif,
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
            color: AppConstants.primaryColor,
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
            color: AppConstants.surfaceColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: AppConstants.primaryColor,
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
                AppConstants.activeLearningHubTitle,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                AppConstants.activeLearningHubSubtitle,
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
            color: AppConstants.surfaceColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppConstants.learningChartTitle,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildChartBar(0.3, AppConstants.flutterColor),
                  _buildChartBar(0.7, AppConstants.flutterColor),
                  _buildChartBar(0.4, AppConstants.oopColor),
                  _buildChartBar(0.8, AppConstants.primaryColor),
                  _buildChartBar(1.0, AppConstants.secondaryColor),
                  _buildChartBar(0.6, const Color(0xFF4CAF50)),
                ],
              ),
            ],
          ),
        ),
      ),
    ];
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
}