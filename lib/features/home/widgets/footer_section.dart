import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/social_links.dart';
import '../../../core/models/app_constants.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../shared/services/url_launcher_service.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ResponsiveHelper.isMobile(context);
        
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppConstants.backgroundColor,
                Color(0xFF111113),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.getHorizontalPadding(context),
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
                        AppConstants.primaryColor.withValues(alpha: 0.3),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Copyright
                _buildCopyright(isMobile),
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
                  colors: [AppConstants.primaryColor, AppConstants.secondaryColor],
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppConstants.primaryColor.withValues(alpha: 0.3),
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
                    colors: [AppConstants.primaryColor, AppConstants.secondaryColor],
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
                  AppConstants.appSubtitle,
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
          AppConstants.tagline,
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
          AppConstants.connectTitle,
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
                children: SocialLinks.links
                    .map((link) => _buildSocialLink(link))
                    .toList(),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: SocialLinks.links
                    .map((link) => Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: _buildSocialLink(link),
                        ))
                    .toList(),
              ),
      ],
    );
  }

  Widget _buildSocialLink(dynamic link) {
    String displayUrl = link.url;
    if (link.url.startsWith('mailto:')) {
      displayUrl = link.url.substring(7);
    } else if (link.url.startsWith('https://')) {
      displayUrl = link.url.substring(8);
    }

    return Tooltip(
      message: '${link.title}\n$displayUrl',
      textStyle: GoogleFonts.inter(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      decoration: BoxDecoration(
        color: AppConstants.surfaceColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: link.color.withValues(alpha: 0.5),
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
          onTap: () => UrlLauncherService.launchURL(link.url),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppConstants.surfaceColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: link.color.withValues(alpha: 0.3),
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
              link.icon,
              size: 24,
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCopyright(bool isMobile) {
    return Column(
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
            colors: [AppConstants.primaryColor, AppConstants.secondaryColor],
          ).createShader(bounds),
          child: Text(
            AppConstants.authorName,
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
    );
  }
}