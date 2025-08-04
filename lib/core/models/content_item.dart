import 'package:flutter/material.dart';

class ContentItem {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final Color color;
  final ContentType type;
  final dynamic content;

  const ContentItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.color,
    required this.type,
    required this.content,
  });
}

enum ContentType {
  definition,
  codeExample,
  keyPoints,
  comparison,
  steps,
  tips,
}

class DefinitionContent {
  final String definition;
  final List<String>? keyPoints;

  const DefinitionContent({
    required this.definition,
    this.keyPoints,
  });
}

class CodeExampleContent {
  final String title;
  final String code;
  final String explanation;
  final String? language;

  const CodeExampleContent({
    required this.title,
    required this.code,
    required this.explanation,
    this.language = 'dart',
  });
}

class KeyPointsContent {
  final List<String> points;

  const KeyPointsContent({
    required this.points,
  });
}

class ComparisonContent {
  final List<ComparisonItem> items;

  const ComparisonContent({
    required this.items,
  });
}

class ComparisonItem {
  final String title;
  final String description;
  final Color? color;

  const ComparisonItem({
    required this.title,
    required this.description,
    this.color,
  });
}

class StepsContent {
  final List<StepItem> steps;

  const StepsContent({
    required this.steps,
  });
}

class StepItem {
  final String title;
  final String description;
  final String? code;

  const StepItem({
    required this.title,
    required this.description,
    this.code,
  });
}

class TipsContent {
  final List<TipItem> tips;

  const TipsContent({
    required this.tips,
  });
}

class TipItem {
  final String title;
  final String description;
  final String? useCase;

  const TipItem({
    required this.title,
    required this.description,
    this.useCase,
  });
}