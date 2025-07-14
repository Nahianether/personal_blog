import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/vs.dart';

import '../providers/blog_provider.dart';
import '../models/blog_models.dart';
import '../widgets/common/post_card.dart';

class PostDetailScreen extends ConsumerStatefulWidget {
  final String postId;
  
  const PostDetailScreen({
    super.key,
    required this.postId,
  });

  @override
  ConsumerState<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends ConsumerState<PostDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  double _scrollProgress = 0.0;
  
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateScrollProgress);
  }
  
  @override
  void dispose() {
    _scrollController.removeListener(_updateScrollProgress);
    _scrollController.dispose();
    super.dispose();
  }
  
  void _updateScrollProgress() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final progress = maxScroll > 0 ? (currentScroll / maxScroll).clamp(0.0, 1.0) : 0.0;
    
    setState(() {
      _scrollProgress = progress;
    });
    
    // Update user progress
    final progressPercentage = (progress * 100).clamp(0.0, 100.0);
    ref.read(blogActionsProvider).updateProgress(widget.postId, progressPercentage);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final posts = ref.watch(postsProvider);
    final post = posts.firstWhere((p) => p.id == widget.postId, orElse: () => posts.first);
    final isBookmarked = ref.watch(isBookmarkedProvider(post.id));
    final isCompleted = ref.watch(isCompletedProvider(post.id));
    final blogActions = ref.read(blogActionsProvider);
    
    // Get related posts (posts with same category or tags)
    final relatedPosts = posts.where((p) => 
      p.id != post.id && 
      (p.category == post.category || 
       p.tags.any((tag) => post.tags.contains(tag)))
    ).take(4).toList();
    
    if (posts.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Post Not Found'),
        ),
        body: const Center(
          child: Text('Post not found'),
        ),
      );
    }
    
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // App Bar with progress indicator
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            backgroundColor: theme.colorScheme.surface,
            surfaceTintColor: Colors.transparent,
            actions: [
              IconButton(
                onPressed: () {
                  blogActions.toggleBookmark(post.id);
                },
                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
                  color: isBookmarked ? theme.colorScheme.primary : null,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Share functionality
                },
                icon: const Icon(Icons.share_outlined),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                post.title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      theme.colorScheme.primary.withValues(alpha: 0.1),
                      theme.colorScheme.surface,
                    ],
                  ),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4),
              child: LinearProgressIndicator(
                value: _scrollProgress,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(
                  theme.colorScheme.primary,
                ),
              ),
            ),
          ),
          
          // Post metadata
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          post.category,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _getDifficultyColor(post.difficulty).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          _getDifficultyLabel(post.difficulty),
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: _getDifficultyColor(post.difficulty),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 16,
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${post.readTimeMinutes} min read',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.update,
                        size: 16,
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Updated ${_formatDate(post.updatedAt)}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          // Post content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: MarkdownBody(
                data: post.content,
                styleSheet: MarkdownStyleSheet(
                  h1: theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  h2: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  h3: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  p: theme.textTheme.bodyLarge?.copyWith(
                    height: 1.6,
                  ),
                  code: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: 'Courier',
                    backgroundColor: theme.colorScheme.surface,
                  ),
                  codeblockDecoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: theme.colorScheme.outline.withValues(alpha: 0.2),
                    ),
                  ),
                ),
                builders: {
                  'code': CodeBlockBuilder(
                    isDarkMode: false, // We'll use light theme for now since we removed theme provider
                  ),
                },
              ),
            ),
          ),
          
          // Code Examples
          if (post.codeExamples.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Code Examples',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...post.codeExamples.map((example) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  example.title,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                if (example.explanation != null) ...[
                                  const SizedBox(height: 8),
                                  Text(
                                    example.explanation!,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                                    ),
                                  ),
                                ],
                                const SizedBox(height: 12),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: HighlightView(
                                    example.code,
                                    language: example.language,
                                    theme: githubTheme, // Using light theme
                                    padding: const EdgeInsets.all(16),
                                    textStyle: theme.textTheme.bodyMedium?.copyWith(
                                      fontFamily: 'Courier',
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          
          // Interview Questions
          if (post.interviewQuestions.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Interview Questions',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...post.interviewQuestions.asMap().entries.map((entry) {
                      final index = entry.key;
                      final question = entry.value;
                      
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Card(
                          child: ExpansionTile(
                            title: Text(
                              'Q${index + 1}: ${question.question}',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              _getQuestionTypeLabel(question.type),
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Answer:',
                                      style: theme.textTheme.titleSmall?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      question.answer,
                                      style: theme.textTheme.bodyMedium?.copyWith(
                                        height: 1.5,
                                      ),
                                    ),
                                    if (question.followUpQuestions.isNotEmpty) ...[
                                      const SizedBox(height: 16),
                                      Text(
                                        'Follow-up Questions:',
                                        style: theme.textTheme.titleSmall?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      ...question.followUpQuestions.map((followUp) {
                                        return Padding(
                                          padding: const EdgeInsets.only(bottom: 4),
                                          child: Text(
                                            '• $followUp',
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                        );
                                      }),
                                    ],
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          
          // Related Posts
          if (relatedPosts.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Related Articles',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: relatedPosts.length,
                      itemBuilder: (context, index) {
                        final relatedPost = relatedPosts[index];
                        return PostCard(
                          post: relatedPost,
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostDetailScreen(
                                  postId: relatedPost.id,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          
          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
      
      // Floating Action Button - Mark as Complete
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (isCompleted) {
            // Already completed, maybe show a message
          } else {
            blogActions.updateProgress(post.id, 100.0);
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                isCompleted 
                    ? 'Article already completed!' 
                    : 'Article marked as completed!',
              ),
            ),
          );
        },
        icon: Icon(
          isCompleted 
              ? Icons.check_circle 
              : Icons.check_circle_outline,
        ),
        label: Text(
          isCompleted 
              ? 'Completed' 
              : 'Mark Complete',
        ),
        backgroundColor: isCompleted 
            ? Colors.green 
            : theme.colorScheme.primary,
      ),
    );
  }
  
  Color _getDifficultyColor(DifficultyLevel difficulty) {
    switch (difficulty) {
      case DifficultyLevel.beginner:
        return Colors.green;
      case DifficultyLevel.intermediate:
        return Colors.orange;
      case DifficultyLevel.advanced:
        return Colors.red;
      case DifficultyLevel.expert:
        return Colors.purple;
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
  
  String _getQuestionTypeLabel(QuestionType type) {
    switch (type) {
      case QuestionType.theoretical:
        return 'Theoretical';
      case QuestionType.practical:
        return 'Practical';
      case QuestionType.coding:
        return 'Coding';
      case QuestionType.systemDesign:
        return 'System Design';
      case QuestionType.behavioral:
        return 'Behavioral';
    }
  }
  
  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else {
      return 'Recently';
    }
  }
}

class CodeBlockBuilder extends MarkdownElementBuilder {
  final bool isDarkMode;
  
  CodeBlockBuilder({required this.isDarkMode});
  
  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    if (element.tag == 'code' && element.attributes['class'] != null) {
      final language = element.attributes['class']!.replaceFirst('language-', '');
      
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: HighlightView(
          element.textContent,
          language: language,
          theme: isDarkMode ? vsTheme : githubTheme,
          padding: const EdgeInsets.all(16),
          textStyle: const TextStyle(
            fontFamily: 'Courier',
            fontSize: 13,
          ),
        ),
      );
    }
    return null;
  }
}