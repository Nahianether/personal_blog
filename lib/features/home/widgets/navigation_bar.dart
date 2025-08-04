import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/models/app_constants.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../shared/services/url_launcher_service.dart';

class CustomNavigationBar extends StatelessWidget {
  final VoidCallback onScrollToTop;
  final VoidCallback onScrollToCourses;

  const CustomNavigationBar({
    super.key,
    required this.onScrollToTop,
    required this.onScrollToCourses,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ResponsiveHelper.isMobile(context);
        
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveHelper.getHorizontalPadding(context),
            vertical: AppConstants.paddingLarge,
          ),
          child: isMobile
              ? _buildMobileNavigation()
              : _buildDesktopNavigation(),
        );
      },
    );
  }

  Widget _buildMobileNavigation() {
    return Column(
      children: [
        // Logo
        _buildLogo(isMobile: true),
        const SizedBox(height: 16),
        // Mobile Navigation
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Center(
                child: _buildNavLink(AppConstants.homeNav, onScrollToTop),
              ),
            ),
            Expanded(
              child: Center(
                child: _buildNavLink(AppConstants.coursesNav, onScrollToCourses),
              ),
            ),
            Expanded(
              child: Center(
                child: _buildAboutMeButton(isMobile: true),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopNavigation() {
    return Row(
      children: [
        _buildLogo(),
        const Spacer(),
        Row(
          children: [
            _buildNavLink(AppConstants.homeNav, onScrollToTop),
            const SizedBox(width: 40),
            _buildNavLink(AppConstants.coursesNav, onScrollToCourses),
            const SizedBox(width: 40),
            _buildAboutMeButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildLogo({bool isMobile = false}) {
    return GestureDetector(
      onTap: onScrollToTop,
      child: Text(
        AppConstants.appTitle,
        style: GoogleFonts.inter(
          fontSize: isMobile ? 24 : 28,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
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

  Widget _buildAboutMeButton({bool isMobile = false}) {
    return GestureDetector(
      onTap: () => UrlLauncherService.launchWebsite(AppConstants.aboutMeUrl),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 12 : 24,
          vertical: isMobile ? 8 : 12,
        ),
        decoration: BoxDecoration(
          color: AppConstants.primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          AppConstants.aboutMeNav,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 12 : 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}