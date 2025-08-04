import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/course_categories.dart';
import '../../../core/models/app_constants.dart';
import '../../../core/utils/responsive_helper.dart';

class CourseCategoriesSection extends StatelessWidget {
  const CourseCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ResponsiveHelper.isMobile(context);
        final isTablet = ResponsiveHelper.isTablet(context);
        
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveHelper.getHorizontalPadding(context),
            vertical: isMobile ? 40 : 60,
          ),
          child: Column(
            crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              Text(
                AppConstants.courseSectionTitle,
                textAlign: isMobile ? TextAlign.center : TextAlign.start,
                style: GoogleFonts.inter(
                  fontSize: isMobile ? 28 : 42,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              SizedBox(height: isMobile ? 40 : 60),
              _buildCourseGrid(context, isMobile, isTablet),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCourseGrid(BuildContext context, bool isMobile, bool isTablet) {
    if (isMobile) {
      return Column(
        children: CourseCategories.categories
            .map((category) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _buildCategoryCard(context, category, isMobile: true),
                ))
            .toList(),
      );
    } else if (isTablet) {
      return Column(
        children: [
          Row(
            children: CourseCategories.categories
                .take(2)
                .map((category) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: _buildCategoryCard(context, category),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 16),
          Row(
            children: CourseCategories.categories
                .skip(2)
                .map((category) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: _buildCategoryCard(context, category),
                      ),
                    ))
                .toList(),
          ),
        ],
      );
    } else {
      return Row(
        children: CourseCategories.categories
            .map((category) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: _buildCategoryCard(context, category),
                  ),
                ))
            .toList(),
      );
    }
  }

  Widget _buildCategoryCard(BuildContext context, dynamic category, {bool isMobile = false}) {
    return GestureDetector(
      onTap: () => context.go(category.route),
      child: Container(
        height: isMobile ? 120 : 200,
        width: isMobile ? double.infinity : null,
        padding: EdgeInsets.all(isMobile ? 20 : 32),
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.circular(isMobile ? 16 : 24),
          boxShadow: [
            BoxShadow(
              color: category.color.withValues(alpha: 0.3),
              blurRadius: isMobile ? 10 : 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: isMobile
            ? Row(
                children: [
                  Icon(
                    category.icon,
                    color: Colors.white,
                    size: 32,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      category.title,
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
                    category.icon,
                    color: Colors.white,
                    size: 48,
                  ),
                  const Spacer(),
                  Text(
                    category.title,
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
}