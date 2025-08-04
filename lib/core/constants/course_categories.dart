import 'package:flutter/material.dart';
import '../models/course_category.dart';
import '../models/app_constants.dart';

class CourseCategories {
  static const List<CourseCategory> categories = [
    CourseCategory(
      id: 'flutter',
      title: 'Flutter\nDevelopment',
      subtitle: 'Build beautiful, fast, and cross-platform mobile applications',
      icon: Icons.phone_android,
      color: AppConstants.flutterColor,
      route: '/flutter',
      description: 'Master Flutter development with comprehensive coverage of mobile app development, from basics to advanced topics.',
    ),
    CourseCategory(
      id: 'rust',
      title: 'Rust\nProgramming',
      subtitle: 'System programming with memory safety and performance',
      icon: Icons.code,
      color: AppConstants.rustColor,
      route: '/rust',
      description: 'Learn Rust programming language with focus on system programming, memory safety, and high performance.',
    ),
    CourseCategory(
      id: 'oop',
      title: 'OOP\nConcepts',
      subtitle: 'Object-oriented programming principles and patterns',
      icon: Icons.design_services,
      color: AppConstants.oopColor,
      route: '/oop',
      description: 'Master object-oriented programming concepts, design patterns, and best practices.',
    ),
    CourseCategory(
      id: 'others',
      title: 'Others\nConcepts',
      subtitle: 'Additional programming concepts and technologies',
      icon: Icons.psychology,
      color: AppConstants.othersColor,
      route: '/others',
      description: 'Explore various programming concepts, algorithms, data structures, and emerging technologies.',
    ),
  ];

  static CourseCategory getCategoryById(String id) {
    return categories.firstWhere(
      (category) => category.id == id,
      orElse: () => categories.first,
    );
  }
}