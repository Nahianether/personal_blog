import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/blog_models.dart';
import '../data/blog_data.dart';

// State providers for different aspects of the blog app
final postsProvider = StateProvider<List<BlogPost>>((ref) => BlogData.blogPosts);
final categoriesProvider = StateProvider<List<Category>>((ref) => BlogData.categories);
final userProgressProvider = StateProvider<List<UserProgress>>((ref) => []);
final searchQueryProvider = StateProvider<String>((ref) => '');
final selectedCategoryProvider = StateProvider<String>((ref) => 'all');
final selectedLanguageProvider = StateProvider<String>((ref) => 'flutter');
final selectedDifficultyProvider = StateProvider<DifficultyLevel?>((ref) => null);

// Filtered posts provider
final filteredPostsProvider = Provider<List<BlogPost>>((ref) {
  final posts = ref.watch(postsProvider);
  final searchQuery = ref.watch(searchQueryProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);
  final selectedLanguage = ref.watch(selectedLanguageProvider);
  final selectedDifficulty = ref.watch(selectedDifficultyProvider);

  return posts.where((post) {
    // Search filter
    if (searchQuery.isNotEmpty) {
      final query = searchQuery.toLowerCase();
      if (!post.title.toLowerCase().contains(query) &&
          !post.excerpt!.toLowerCase().contains(query) &&
          !post.tags.any((tag) => tag.toLowerCase().contains(query))) {
        return false;
      }
    }

    // Category filter
    if (selectedCategory != 'all' && post.category != selectedCategory) {
      return false;
    }

    // Language filter
    if (selectedLanguage != 'all' && post.language != selectedLanguage) {
      return false;
    }

    // Difficulty filter
    if (selectedDifficulty != null && post.difficulty != selectedDifficulty) {
      return false;
    }

    return true;
  }).toList();
});

// Bookmarks provider
final bookmarksProvider = StateProvider<Set<String>>((ref) => <String>{});

// Progress provider
final progressProvider = StateProvider<Map<String, double>>((ref) => {});

// Completed posts provider
final completedPostsProvider = StateProvider<Set<String>>((ref) => <String>{});

// Helper providers for checking states
final isBookmarkedProvider = Provider.family<bool, String>((ref, postId) {
  final bookmarks = ref.watch(bookmarksProvider);
  return bookmarks.contains(postId);
});

final getProgressProvider = Provider.family<double, String>((ref, postId) {
  final progress = ref.watch(progressProvider);
  return progress[postId] ?? 0.0;
});

final isCompletedProvider = Provider.family<bool, String>((ref, postId) {
  final completed = ref.watch(completedPostsProvider);
  return completed.contains(postId);
});

// Actions as separate providers
class BlogActions {
  final Ref ref;
  
  BlogActions(this.ref);

  void toggleBookmark(String postId) {
    final bookmarks = ref.read(bookmarksProvider.notifier);
    final currentBookmarks = ref.read(bookmarksProvider);
    
    if (currentBookmarks.contains(postId)) {
      bookmarks.state = {...currentBookmarks}..remove(postId);
    } else {
      bookmarks.state = {...currentBookmarks, postId};
    }
    _saveBookmarks();
  }

  void updateProgress(String postId, double progress) {
    final progressNotifier = ref.read(progressProvider.notifier);
    final currentProgress = ref.read(progressProvider);
    
    progressNotifier.state = {...currentProgress, postId: progress};
    
    if (progress >= 100.0) {
      final completedNotifier = ref.read(completedPostsProvider.notifier);
      final currentCompleted = ref.read(completedPostsProvider);
      completedNotifier.state = {...currentCompleted, postId};
    }
    _saveProgress();
  }

  void setSearchQuery(String query) {
    ref.read(searchQueryProvider.notifier).state = query;
  }

  void setSelectedCategory(String category) {
    ref.read(selectedCategoryProvider.notifier).state = category;
  }

  void setSelectedLanguage(String language) {
    ref.read(selectedLanguageProvider.notifier).state = language;
  }

  void setSelectedDifficulty(DifficultyLevel? difficulty) {
    ref.read(selectedDifficultyProvider.notifier).state = difficulty;
  }

  Future<void> _saveBookmarks() async {
    final bookmarks = ref.read(bookmarksProvider);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('bookmarks', bookmarks.toList());
  }

  Future<void> _saveProgress() async {
    final progress = ref.read(progressProvider);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('progress', progress.toString());
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Load bookmarks
    final bookmarksList = prefs.getStringList('bookmarks') ?? [];
    ref.read(bookmarksProvider.notifier).state = bookmarksList.toSet();
    
    // Load progress
    // final progressString = prefs.getString('progress') ?? '{}';
    // Simple parsing - in real app you'd use proper JSON parsing
    final progressNotifier = ref.read(progressProvider.notifier);
    progressNotifier.state = {}; // Reset and load from preferences
  }
}

// Provider for actions
final blogActionsProvider = Provider<BlogActions>((ref) {
  return BlogActions(ref);
});