import 'package:flutter/material.dart';
import '../models/app_constants.dart';

class SocialLink {
  final String title;
  final String url;
  final IconData icon;
  final Color color;

  const SocialLink({
    required this.title,
    required this.url,
    required this.icon,
    required this.color,
  });
}

class SocialLinks {
  static const List<SocialLink> links = [
    SocialLink(
      title: 'GitHub',
      url: AppConstants.githubUrl,
      icon: Icons.code,
      color: AppConstants.githubColor,
    ),
    SocialLink(
      title: 'LinkedIn',
      url: AppConstants.linkedinUrl,
      icon: Icons.business,
      color: AppConstants.linkedinColor,
    ),
    SocialLink(
      title: 'Gmail',
      url: AppConstants.emailUrl,
      icon: Icons.mail,
      color: AppConstants.gmailColor,
    ),
    SocialLink(
      title: 'Portfolio',
      url: AppConstants.portfolioUrl,
      icon: Icons.language,
      color: AppConstants.portfolioColor,
    ),
  ];

  static List<SocialLink> getSocialLinks() => links;
}