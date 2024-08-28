import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../blog/blog.view.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  BlogPageState createState() => BlogPageState();
}

class BlogPageState extends State<BlogPage> {
  int _selectedCategoryIndex = 0;
  int? _selectedSubCategoryIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Concepts'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: blogData.length,
              itemBuilder: (context, index) {
                return blogData[index].subCategory == null || blogData[index].subCategory!.isEmpty
                    ? ListTile(
                        title: Text(blogData[index].category),
                        onTap: () {
                          setState(() {
                            _selectedCategoryIndex = index;
                            _selectedSubCategoryIndex = null;
                          });
                        },
                      )
                    : ExpansionTile(
                        title: Text(blogData[index].category),
                        children: List.generate(
                          blogData[index].subCategory!.length,
                          (subIndex) => Container(
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: _selectedCategoryIndex == index && _selectedSubCategoryIndex == subIndex
                                      ? Colors.blue
                                      : Colors.white,
                                  width: 5,
                                ),
                              ),
                            ),
                            child: ListTile(
                              title: Text(blogData[index].subCategory![subIndex].category),
                              onTap: () {
                                setState(() {
                                  _selectedCategoryIndex = index;
                                  _selectedSubCategoryIndex = subIndex;
                                });
                              },
                            ),
                          ),
                        ),
                      );
              },
            ),
          ),
          const VerticalDivider(),
          BlogContentView(
              selectedSubCategoryIndex: _selectedSubCategoryIndex, selectedCategoryIndex: _selectedCategoryIndex),
        ],
      ),
    );
  }
}
