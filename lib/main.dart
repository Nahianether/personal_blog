import 'package:flutter/material.dart';

void main() => runApp(const MyBlogApp());

class MyBlogApp extends StatelessWidget {
  const MyBlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter Blog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlogHomePage(),
    );
  }
}

class BlogHomePage extends StatelessWidget {
  final List<Map<String, String>> blogPosts = [
    {
      'title': 'Welcome to My Flutter Blog',
      'content': 'This is the first post on my Flutter blog. Stay tuned for more updates!'
    },
    {
      'title': 'Understanding Flutter Widgets',
      'content': 'In this post, we explore the basics of Flutter widgets and how to use them.'
    },
    {
      'title': 'State Management in Flutter',
      'content': 'State management is crucial in Flutter apps. Learn about different approaches.'
    },
  ];

  BlogHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Flutter Blog'),
      ),
      body: ListView.builder(
        itemCount: blogPosts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(blogPosts[index]['title']!),
              subtitle: Text(blogPosts[index]['content']!.substring(0, 50) + '...'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlogPostPage(
                      title: blogPosts[index]['title']!,
                      content: blogPosts[index]['content']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class BlogPostPage extends StatelessWidget {
  final String title;
  final String content;

  BlogPostPage({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(content, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
