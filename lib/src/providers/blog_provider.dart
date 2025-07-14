import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/blog_models.dart';
import '../data/blog_data.dart';

class BlogProvider with ChangeNotifier {
  List<BlogPost> _posts = [];
  List<Category> _categories = [];
  final List<UserProgress> _userProgress = [];
  String _searchQuery = '';
  String _selectedCategory = 'all';
  String _selectedLanguage = 'flutter';
  DifficultyLevel? _selectedDifficulty;
  
  // Getters
  List<BlogPost> get posts => _posts;
  List<Category> get categories => _categories;
  List<UserProgress> get userProgress => _userProgress;
  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;
  String get selectedLanguage => _selectedLanguage;
  DifficultyLevel? get selectedDifficulty => _selectedDifficulty;
  
  // Filtered posts based on current filters
  List<BlogPost> get filteredPosts {
    List<BlogPost> filtered = _posts;
    
    // Filter by language
    filtered = filtered.where((post) => post.language == _selectedLanguage).toList();
    
    // Filter by category
    if (_selectedCategory != 'all') {
      filtered = filtered.where((post) => post.category == _selectedCategory).toList();
    }
    
    // Filter by difficulty
    if (_selectedDifficulty != null) {
      filtered = filtered.where((post) => post.difficulty == _selectedDifficulty).toList();
    }
    
    // Filter by search query
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((post) {
        return post.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
               post.content.toLowerCase().contains(_searchQuery.toLowerCase()) ||
               post.tags.any((tag) => tag.toLowerCase().contains(_searchQuery.toLowerCase()));
      }).toList();
    }
    
    return filtered;
  }
  
  // Bookmarked posts
  List<BlogPost> get bookmarkedPosts {
    final bookmarkedIds = _userProgress
        .where((progress) => progress.isBookmarked)
        .map((progress) => progress.postId)
        .toList();
    
    return _posts.where((post) => bookmarkedIds.contains(post.id)).toList();
  }
  
  // Completed posts
  List<BlogPost> get completedPosts {
    final completedIds = _userProgress
        .where((progress) => progress.isCompleted)
        .map((progress) => progress.postId)
        .toList();
    
    return _posts.where((post) => completedIds.contains(post.id)).toList();
  }
  
  // Progress statistics
  double get overallProgress {
    if (_posts.isEmpty) return 0.0;
    final completed = completedPosts.length;
    return completed / _posts.length;
  }
  
  Map<String, int> get progressByCategory {
    final Map<String, int> result = {};
    
    for (final category in _categories) {
      final categoryPosts = _posts.where((post) => post.category == category.name).toList();
      final completedInCategory = completedPosts.where((post) => post.category == category.name).length;
      result[category.name] = categoryPosts.isEmpty ? 0 : ((completedInCategory / categoryPosts.length) * 100).round();
    }
    
    return result;
  }
  
  BlogProvider() {
    _loadData();
  }
  
  void _loadData() async {
    // Load blog posts and categories from data
    _posts = BlogData.posts;
    _categories = BlogData.categories;
    
    // Load user progress from storage
    await _loadUserProgress();
    
    notifyListeners();
  }
  
  Future<void> _loadUserProgress() async {
    final prefs = await SharedPreferences.getInstance();
    // Load user progress from SharedPreferences
    // This would be implemented based on your storage strategy
  }
  
  Future<void> _saveUserProgress() async {
    final prefs = await SharedPreferences.getInstance();
    // Save user progress to SharedPreferences
    // This would be implemented based on your storage strategy
  }
  
  // Search functionality
  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
  
  void clearSearch() {
    _searchQuery = '';
    notifyListeners();
  }
  
  // Filter functionality
  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
  
  void setSelectedLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }
  
  void setSelectedDifficulty(DifficultyLevel? difficulty) {
    _selectedDifficulty = difficulty;
    notifyListeners();
  }
  
  void clearFilters() {
    _selectedCategory = 'all';
    _selectedDifficulty = null;
    _searchQuery = '';
    notifyListeners();
  }
  
  // User progress management
  void toggleBookmark(String postId) {
    final existingIndex = _userProgress.indexWhere((p) => p.postId == postId);
    
    if (existingIndex >= 0) {
      _userProgress[existingIndex] = UserProgress(
        postId: postId,
        isCompleted: _userProgress[existingIndex].isCompleted,
        isBookmarked: !_userProgress[existingIndex].isBookmarked,
        lastReadAt: DateTime.now(),
        progressPercentage: _userProgress[existingIndex].progressPercentage,
        timeSpentMinutes: _userProgress[existingIndex].timeSpentMinutes,
      );
    } else {
      _userProgress.add(UserProgress(
        postId: postId,
        isCompleted: false,
        isBookmarked: true,
        lastReadAt: DateTime.now(),
        progressPercentage: 0.0,
        timeSpentMinutes: 0,
      ));
    }
    
    _saveUserProgress();
    notifyListeners();
  }
  
  void markAsCompleted(String postId) {
    final existingIndex = _userProgress.indexWhere((p) => p.postId == postId);
    
    if (existingIndex >= 0) {
      _userProgress[existingIndex] = UserProgress(
        postId: postId,
        isCompleted: true,
        isBookmarked: _userProgress[existingIndex].isBookmarked,
        lastReadAt: DateTime.now(),
        progressPercentage: 100.0,
        timeSpentMinutes: _userProgress[existingIndex].timeSpentMinutes,
      );
    } else {
      _userProgress.add(UserProgress(
        postId: postId,
        isCompleted: true,
        isBookmarked: false,
        lastReadAt: DateTime.now(),
        progressPercentage: 100.0,
        timeSpentMinutes: 0,
      ));
    }
    
    _saveUserProgress();
    notifyListeners();
  }
  
  void updateProgress(String postId, double progress, int timeSpent) {
    final existingIndex = _userProgress.indexWhere((p) => p.postId == postId);
    
    if (existingIndex >= 0) {
      _userProgress[existingIndex] = UserProgress(
        postId: postId,
        isCompleted: progress >= 100.0,
        isBookmarked: _userProgress[existingIndex].isBookmarked,
        lastReadAt: DateTime.now(),
        progressPercentage: progress,
        timeSpentMinutes: timeSpent,
      );
    } else {
      _userProgress.add(UserProgress(
        postId: postId,
        isCompleted: progress >= 100.0,
        isBookmarked: false,
        lastReadAt: DateTime.now(),
        progressPercentage: progress,
        timeSpentMinutes: timeSpent,
      ));
    }
    
    _saveUserProgress();
    notifyListeners();
  }
  
  // Utility methods
  bool isBookmarked(String postId) {
    return _userProgress.any((p) => p.postId == postId && p.isBookmarked);
  }
  
  bool isCompleted(String postId) {
    return _userProgress.any((p) => p.postId == postId && p.isCompleted);
  }
  
  double getProgress(String postId) {
    final progress = _userProgress.firstWhere(
      (p) => p.postId == postId,
      orElse: () => UserProgress(
        postId: postId,
        isCompleted: false,
        isBookmarked: false,
        lastReadAt: DateTime.now(),
        progressPercentage: 0.0,
        timeSpentMinutes: 0,
      ),
    );
    return progress.progressPercentage;
  }
  
  BlogPost? getPostById(String id) {
    try {
      return _posts.firstWhere((post) => post.id == id);
    } catch (e) {
      return null;
    }
  }
  
  List<BlogPost> getRelatedPosts(String postId, {int limit = 5}) {
    final currentPost = getPostById(postId);
    if (currentPost == null) return [];
    
    return _posts
        .where((post) => 
            post.id != postId && 
            (post.category == currentPost.category || 
             post.tags.any((tag) => currentPost.tags.contains(tag))))
        .take(limit)
        .toList();
  }
}