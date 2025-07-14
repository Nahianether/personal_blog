import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/blog_provider.dart';
import '../widgets/common/search_bar.dart';
import '../widgets/common/post_card.dart';
import '../widgets/common/category_chip.dart';
import '../models/blog_models.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: theme.colorScheme.surface,
        surfaceTintColor: Colors.transparent,
      ),
      body: Consumer<BlogProvider>(
        builder: (context, blogProvider, child) {
          return CustomScrollView(
            slivers: [
              // Search Bar
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ModernSearchBar(
                    initialValue: blogProvider.searchQuery,
                    onSearchChanged: (query) {
                      blogProvider.setSearchQuery(query);
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
                            isSelected: blogProvider.selectedDifficulty == null,
                            onTap: () => blogProvider.setSelectedDifficulty(null),
                          ),
                          ...DifficultyLevel.values.map((difficulty) {
                            return CategoryChip(
                              label: _getDifficultyLabel(difficulty),
                              isSelected: blogProvider.selectedDifficulty == difficulty,
                              onTap: () => blogProvider.setSelectedDifficulty(difficulty),
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
                            isSelected: blogProvider.selectedCategory == 'all',
                            onTap: () => blogProvider.setSelectedCategory('all'),
                          ),
                          ...blogProvider.categories.map((category) {
                            return CategoryChip(
                              label: category.name,
                              icon: category.icon,
                              isSelected: blogProvider.selectedCategory == category.name,
                              onTap: () => blogProvider.setSelectedCategory(category.name),
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
                            'Results (${blogProvider.filteredPosts.length})',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              blogProvider.clearFilters();
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
              if (blogProvider.filteredPosts.isEmpty)
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
                        final post = blogProvider.filteredPosts[index];
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
                      childCount: blogProvider.filteredPosts.length,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
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
}