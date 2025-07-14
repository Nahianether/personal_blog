import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/blog_provider.dart';
import '../widgets/common/search_bar.dart';
import '../widgets/common/post_card.dart';
import '../widgets/common/category_chip.dart';
import '../models/blog_models.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final searchQuery = ref.watch(searchQueryProvider);
    final selectedDifficulty = ref.watch(selectedDifficultyProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final categories = ref.watch(categoriesProvider);
    final filteredPosts = ref.watch(filteredPostsProvider);
    final blogActions = ref.read(blogActionsProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: theme.colorScheme.surface,
        surfaceTintColor: Colors.transparent,
      ),
      body: CustomScrollView(
        slivers: [
          // Search Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ModernSearchBar(
                initialValue: searchQuery,
                onSearchChanged: (query) {
                  blogActions.setSearchQuery(query);
                },
              ),
            ),
          ),
          
          // Filters
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Filters',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  // Difficulty Filter
                  Text(
                    'Difficulty',
                    style: theme.textTheme.labelMedium,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      CategoryChip(
                        label: 'All',
                        isSelected: selectedDifficulty == null,
                        onTap: () => blogActions.setSelectedDifficulty(null),
                      ),
                      ...DifficultyLevel.values.map((difficulty) {
                        return CategoryChip(
                          label: _getDifficultyLabel(difficulty),
                          isSelected: selectedDifficulty == difficulty,
                          onTap: () => blogActions.setSelectedDifficulty(difficulty),
                        );
                      }),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Category Filter
                  Text(
                    'Categories',
                    style: theme.textTheme.labelMedium,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      CategoryChip(
                        label: 'All',
                        isSelected: selectedCategory == 'all',
                        onTap: () => blogActions.setSelectedCategory('all'),
                      ),
                      ...categories.map((category) {
                        return CategoryChip(
                          label: category.name,
                          icon: category.icon,
                          isSelected: selectedCategory == category.name,
                          onTap: () => blogActions.setSelectedCategory(category.name),
                        );
                      }),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Clear filters
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Results (${filteredPosts.length})',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          blogActions.setSearchQuery('');
                          blogActions.setSelectedCategory('all');
                          blogActions.setSelectedDifficulty(null);
                        },
                        child: const Text('Clear Filters'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          // Results
          if (filteredPosts.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_off,
                      size: 64,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No results found',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Try adjusting your search or filters',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final post = filteredPosts[index];
                    return PostCard(
                      post: post,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/post-detail',
                          arguments: post.id,
                        );
                      },
                    );
                  },
                  childCount: filteredPosts.length,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

String _getDifficultyLabel(DifficultyLevel difficulty) {
  switch (difficulty) {
    case DifficultyLevel.beginner:
      return 'Beginner';
    case DifficultyLevel.intermediate:
      return 'Intermediate';
    case DifficultyLevel.advanced:
      return 'Advanced';
    case DifficultyLevel.expert:
      return 'Expert';
  }
}