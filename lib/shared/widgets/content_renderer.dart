import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/models/content_item.dart';
import '../../core/models/app_constants.dart';

class ContentRenderer extends StatelessWidget {
  final ContentItem item;
  final GlobalKey? sectionKey;

  const ContentRenderer({
    super.key,
    required this.item,
    this.sectionKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sectionKey,
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.paddingLarge),
      decoration: BoxDecoration(
        color: AppConstants.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: item.color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: item.color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            item.icon,
            color: item.color,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.description,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    switch (item.type) {
      case ContentType.definition:
        return _buildDefinitionContent(item.content as DefinitionContent);
      case ContentType.codeExample:
        return _buildCodeExampleContent(item.content as CodeExampleContent);
      case ContentType.keyPoints:
        return _buildKeyPointsContent(item.content as KeyPointsContent);
      case ContentType.comparison:
        return _buildComparisonContent(item.content as ComparisonContent);
      case ContentType.steps:
        return _buildStepsContent(item.content as StepsContent);
      case ContentType.tips:
        return _buildTipsContent(item.content as TipsContent);
    }
  }

  Widget _buildDefinitionContent(DefinitionContent content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppConstants.borderColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            content.definition,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
              height: 1.4,
            ),
          ),
        ),
        if (content.keyPoints != null && content.keyPoints!.isNotEmpty) ...[
          const SizedBox(height: 16),
          ...content.keyPoints!.map((point) => _buildBulletPoint(point)),
        ],
      ],
    );
  }

  Widget _buildCodeExampleContent(CodeExampleContent content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          content.title,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          child: Text(
            content.code,
            style: GoogleFonts.sourceCodePro(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF7FB069),
              height: 1.4,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content.explanation,
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.white60,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget _buildKeyPointsContent(KeyPointsContent content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Points',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        ...content.points.map((point) => _buildBulletPoint(point)),
      ],
    );
  }

  Widget _buildComparisonContent(ComparisonContent content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: content.items.map((comparison) => 
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comparison.title,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: item.color,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                comparison.description,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ).toList(),
    );
  }

  Widget _buildStepsContent(StepsContent content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: content.steps.map((step) => 
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 6,
                height: 6,
                margin: const EdgeInsets.only(top: 6),
                decoration: BoxDecoration(
                  color: item.color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                    ),
                    children: [
                      TextSpan(
                        text: '${step.title}: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: item.color,
                        ),
                      ),
                      TextSpan(text: step.description),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ).toList(),
    );
  }

  Widget _buildTipsContent(TipsContent content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: content.tips.map((tip) => 
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppConstants.borderColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tip.title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: item.color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  tip.description,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: Colors.white70,
                  ),
                ),
                if (tip.useCase != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    '💡 ${tip.useCase}',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.white60,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ).toList(),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: item.color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}