import 'package:hive/hive.dart';

part 'blog_models.g.dart';

@HiveType(typeId: 0)
class BlogPost extends HiveObject {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String title;
  
  @HiveField(2)
  final String content;
  
  @HiveField(3)
  final String category;
  
  @HiveField(4)
  final List<String> tags;
  
  @HiveField(5)
  final DateTime createdAt;
  
  @HiveField(6)
  final DateTime updatedAt;
  
  @HiveField(7)
  final int readTimeMinutes;
  
  @HiveField(8)
  final String? excerpt;
  
  @HiveField(9)
  final List<CodeExample> codeExamples;
  
  @HiveField(10)
  final List<InterviewQuestion> interviewQuestions;
  
  @HiveField(11)
  final DifficultyLevel difficulty;
  
  @HiveField(12)
  final String language; // 'flutter', 'rust', etc.
  
  @HiveField(13)
  final List<String> relatedTopics;

  BlogPost({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
    required this.readTimeMinutes,
    this.excerpt,
    this.codeExamples = const [],
    this.interviewQuestions = const [],
    required this.difficulty,
    required this.language,
    this.relatedTopics = const [],
  });
}

@HiveType(typeId: 1)
class CodeExample extends HiveObject {
  @HiveField(0)
  final String title;
  
  @HiveField(1)
  final String code;
  
  @HiveField(2)
  final String language; // 'dart', 'rust', 'kotlin', etc.
  
  @HiveField(3)
  final String? explanation;
  
  @HiveField(4)
  final List<String> highlights;

  CodeExample({
    required this.title,
    required this.code,
    required this.language,
    this.explanation,
    this.highlights = const [],
  });
}

@HiveType(typeId: 2)
class InterviewQuestion extends HiveObject {
  @HiveField(0)
  final String question;
  
  @HiveField(1)
  final String answer;
  
  @HiveField(2)
  final QuestionType type;
  
  @HiveField(3)
  final List<String> followUpQuestions;
  
  @HiveField(4)
  final DifficultyLevel difficulty;

  InterviewQuestion({
    required this.question,
    required this.answer,
    required this.type,
    this.followUpQuestions = const [],
    required this.difficulty,
  });
}

@HiveType(typeId: 3)
class Category extends HiveObject {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String name;
  
  @HiveField(2)
  final String description;
  
  @HiveField(3)
  final String icon;
  
  @HiveField(4)
  final String color;
  
  @HiveField(5)
  final List<String> subCategories;
  
  @HiveField(6)
  final String language; // 'flutter', 'rust', etc.

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    this.subCategories = const [],
    required this.language,
  });
}

@HiveType(typeId: 4)
class UserProgress extends HiveObject {
  @HiveField(0)
  final String postId;
  
  @HiveField(1)
  final bool isCompleted;
  
  @HiveField(2)
  final bool isBookmarked;
  
  @HiveField(3)
  final DateTime lastReadAt;
  
  @HiveField(4)
  final double progressPercentage;
  
  @HiveField(5)
  final int timeSpentMinutes;

  UserProgress({
    required this.postId,
    required this.isCompleted,
    required this.isBookmarked,
    required this.lastReadAt,
    required this.progressPercentage,
    required this.timeSpentMinutes,
  });
}

@HiveType(typeId: 5)
enum DifficultyLevel {
  @HiveField(0)
  beginner,
  
  @HiveField(1)
  intermediate,
  
  @HiveField(2)
  advanced,
  
  @HiveField(3)
  expert,
}

@HiveType(typeId: 6)
enum QuestionType {
  @HiveField(0)
  theoretical,
  
  @HiveField(1)
  practical,
  
  @HiveField(2)
  coding,
  
  @HiveField(3)
  systemDesign,
  
  @HiveField(4)
  behavioral,
}

// Search Result Model
class SearchResult {
  final String id;
  final String title;
  final String excerpt;
  final String category;
  final List<String> tags;
  final DifficultyLevel difficulty;
  final String language;
  final double relevanceScore;

  SearchResult({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.category,
    required this.tags,
    required this.difficulty,
    required this.language,
    required this.relevanceScore,
  });
}

// Theme Configuration
class AppTheme {
  static const String fontFamily = 'Inter';
  
  // Colors
  static const primaryColor = 0xFF2563EB;
  static const secondaryColor = 0xFF64748B;
  static const accentColor = 0xFF06B6D4;
  static const backgroundColor = 0xFFF8FAFC;
  static const surfaceColor = 0xFFFFFFFF;
  static const textPrimary = 0xFF1E293B;
  static const textSecondary = 0xFF475569;
  static const borderColor = 0xFFE2E8F0;
  
  // Dark Theme Colors
  static const darkBackgroundColor = 0xFF0F172A;
  static const darkSurfaceColor = 0xFF1E293B;
  static const darkTextPrimary = 0xFFF1F5F9;
  static const darkTextSecondary = 0xFF94A3B8;
  static const darkBorderColor = 0xFF334155;
}