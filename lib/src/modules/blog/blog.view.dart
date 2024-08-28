import 'package:flutter/material.dart';

import '../../data/data.dart';

class BlogContentView extends StatelessWidget {
  const BlogContentView({
    super.key,
    required int? selectedSubCategoryIndex,
    required int selectedCategoryIndex,
  }) : _selectedSubCategoryIndex = selectedSubCategoryIndex, _selectedCategoryIndex = selectedCategoryIndex;

  final int? _selectedSubCategoryIndex;
  final int _selectedCategoryIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _selectedSubCategoryIndex == null
                  ? blogData[_selectedCategoryIndex].category
                  : blogData[_selectedCategoryIndex].subCategory![_selectedSubCategoryIndex].category,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...(_selectedSubCategoryIndex == null
                ? blogData[_selectedCategoryIndex].content.map((content) => Text(content)).toList()
                : blogData[_selectedCategoryIndex]
                    .subCategory![_selectedSubCategoryIndex]
                    .content
                    .map((content) => Text(content))
                    .toList()),
          ],
        ),
      ),
    );
  }
}