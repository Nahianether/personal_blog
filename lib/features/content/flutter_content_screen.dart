import 'package:flutter/material.dart';
import '../../core/constants/flutter_content.dart';
import '../../core/models/app_constants.dart';
import '../../shared/widgets/content_index_tab.dart';
import '../../shared/widgets/content_renderer.dart';
import 'base_content_screen.dart';

class FlutterContentScreen extends BaseContentScreen {
  const FlutterContentScreen({super.key});

  @override
  State<FlutterContentScreen> createState() => _FlutterContentScreenState();
}

class _FlutterContentScreenState extends BaseContentScreenState<FlutterContentScreen> {
  final Map<String, GlobalKey> _contentKeys = {
    for (final item in FlutterContent.items) item.id: GlobalKey()
  };

  @override
  String get screenTitle => 'Flutter Development';

  @override
  String get screenSubtitle => 'Build beautiful, fast, and cross-platform mobile applications';

  @override
  IconData get screenIcon => Icons.phone_android;

  @override
  Color get screenColor => AppConstants.flutterColor;

  @override
  List<IndexItem> get indexItems {
    return FlutterContent.items.map((item) => IndexItem(
      id: item.id,
      title: item.title,
      subtitle: item.subtitle,
      icon: item.icon,
      color: item.color,
      globalKey: _contentKeys[item.id]!,
    )).toList();
  }

  @override
  Widget buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Course Overview
        buildContentSection(
          'Course Overview',
          'Master Flutter development with comprehensive coverage of mobile app development, from basics to advanced topics.',
          [],
          showBullets: false,
        ),
        const SizedBox(height: 32),
        
        // Dynamic Content Sections
        ...FlutterContent.items.map((item) => Column(
          children: [
            ContentRenderer(
              item: item,
              sectionKey: _contentKeys[item.id],
            ),
            const SizedBox(height: 24),
          ],
        )),
      ],
    );
  }
}