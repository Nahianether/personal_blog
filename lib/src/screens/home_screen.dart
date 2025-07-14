import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/blog_provider.dart';
import '../widgets/common/post_card.dart';
import '../widgets/common/category_chip.dart';
import '../widgets/common/search_bar.dart';
import '../widgets/common/app_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<BlogProvider>(
          builder: (context, blogProvider, child) {
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                // App Header
                const SliverToBoxAdapter(
                  child: AppHeader(),
                ),
                
                // Search Bar
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ModernSearchBar(
                      onSearchChanged: (query) {
                        blogProvider.setSearchQuery(query);
                      },
                    ),
                  ),
                ),
                
                // Language Selector
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Text(
                          'Language: ',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(width: 8),
                        _buildLanguageChip(context, 'flutter', 'Flutter'),
                        const SizedBox(width: 8),
                        _buildLanguageChip(context, 'rust', 'Rust'),
                      ],
                    ),
                  ),
                ),
                
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                
                // Categories
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: blogProvider.categories.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CategoryChip(
                              label: 'All',
                              isSelected: blogProvider.selectedCategory == 'all',
                              onTap: () {
                                blogProvider.setSelectedCategory('all');
                              },
                            ),
                          );
                        }
                        
                        final category = blogProvider.categories[index - 1];
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: CategoryChip(
                            label: category.name,
                            icon: category.icon,
                            isSelected: blogProvider.selectedCategory == category.name,
                            onTap: () {
                              blogProvider.setSelectedCategory(category.name);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                
                // Posts Grid
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.85,
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
                
                const SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            );
          },
        ),
      ),
    );
  }
  
  Widget _buildLanguageChip(BuildContext context, String value, String label) {
    final blogProvider = Provider.of<BlogProvider>(context);
    final isSelected = blogProvider.selectedLanguage == value;
    
    return GestureDetector(
      onTap: () {
        blogProvider.setSelectedLanguage(value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outline,
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: isSelected
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.onSurface,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}