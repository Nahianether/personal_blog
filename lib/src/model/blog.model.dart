class BlogModel {
  final String category;
  final List<BlogModel>? subCategory;
  final List<String> content;

  BlogModel({
    required this.category,
    this.subCategory,
    required this.content,
  });
}
