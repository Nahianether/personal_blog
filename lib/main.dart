import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlogPage(),
    );
  }
}

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  int _selectedIndex = 0;

  final List<String> categories = [
    'OOP Concepts',
    'SOLID Principles',
    'Flutter Concepts',
    'Databases in Flutter',
    'Method Channels',
    'Hot Reload vs. Hot Restart',
    'Google Map Implementation',
    'Design Patterns in Flutter',
    'State Management',
  ];

  final List<String> content = [
    // Detailed content for each category here
    'Content about OOP Concepts...',
    'Content about SOLID Principles...',
    'Content about Flutter Concepts...',
    'Content about Databases in Flutter...',
    'Content about Method Channels...',
    'Content about Hot Reload vs. Hot Restart...',
    'Content about Google Map Implementation...',
    'Content about Design Patterns in Flutter...',
    'Content about State Management...',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Concepts'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                ListTile(
                  title: ExpansionTile(
                    title: Text('OOP Concepts'),
                    children: <Widget>[
                      Text('Class'),
                      Text('Object'),
                      Text('Inheritance'),
                      Text('Polymorphism'),
                      Text('Abstraction'),
                      Text('Encapsulation'),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      // _selectedIndex = index;
                    });
                  },
                ),
              ],
            ),
          ),
          VerticalDivider(),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(content[_selectedIndex]),
            ),
          ),
        ],
      ),
    );
  }
}
