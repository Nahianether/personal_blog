# Personal Blog

A Flutter application for creating and sharing personal blog posts with a clean, modern interface.

## ✨ Features

- **Create Blog Posts** - Write and publish personal blog entries
- **Rich Text Editor** - Support for formatting text, adding links, and media
- **Responsive Design** - Works perfectly on mobile, tablet, and desktop
- **Clean UI** - Modern and intuitive user interface
- **Post Management** - Edit, update, and delete your blog posts
- **Categories & Tags** - Organize posts with categories and tags
- **Search Functionality** - Find posts quickly with search
- **Offline Support** - Read previously loaded posts offline
- **Dark/Light Theme** - Switch between dark and light modes

## 🛠️ Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **State Management:** Provider/Bloc (based on implementation)
- **Storage:** Local Storage/Firebase (for posts and user data)
- **UI:** Material Design components
- **Architecture:** Clean Architecture pattern

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio/VS Code
- iOS Simulator/Android Emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Nahianether/personal_blog.git
   cd personal_blog
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 🎯 How to Use

### Creating a New Post
1. Tap the "+" button on the home screen
2. Enter your blog post title
3. Write your content in the text editor
4. Add tags or categories (optional)
5. Tap "Publish" to save your post

### Managing Posts
- **Edit**: Tap on any post to edit it
- **Delete**: Swipe left or use the delete button
- **Search**: Use the search bar to find specific posts
- **Filter**: Filter posts by categories or tags

### Customization
- **Theme**: Switch between light and dark themes in settings
- **Font Size**: Adjust reading font size in settings
- **Categories**: Create custom categories for your posts

## 📁 Project Structure

```
lib/
├── main.dart              # App entry point
├── screens/               # UI screens
│   ├── home_screen.dart   # Main blog list
│   ├── post_screen.dart   # Individual post view
│   ├── create_post_screen.dart # Create/Edit posts
│   └── settings_screen.dart # App settings
├── widgets/               # Reusable UI components
│   ├── post_card.dart     # Blog post card widget
│   ├── rich_text_editor.dart # Text editor widget
│   └── search_bar.dart    # Search functionality
├── models/                # Data models
│   ├── blog_post.dart     # Blog post model
│   └── category.dart      # Category model
├── services/              # Business logic
│   ├── blog_service.dart  # Blog operations
│   └── storage_service.dart # Data storage
├── utils/                 # Utility functions
│   ├── constants.dart     # App constants
│   └── themes.dart        # Theme definitions
└── providers/             # State management
    ├── blog_provider.dart # Blog state management
    └── theme_provider.dart # Theme state
```

## 🔧 Key Features Implementation

### Blog Post Model
```dart
class BlogPost {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> tags;
  final String category;
  
  // Constructor and methods
}
```

### Rich Text Editor
- Support for bold, italic, underline formatting
- Link insertion and management
- Image embedding (if supported)
- Auto-save functionality

### Search & Filter
- Full-text search across all posts
- Filter by categories and tags
- Sort by date, title, or relevance

## 🎨 Customization

### Adding New Themes
1. Navigate to `lib/utils/themes.dart`
2. Add your custom theme configuration
3. Update the theme provider to include the new theme

### Adding New Categories
1. Modify the `Category` model if needed
2. Update the category management in settings
3. Add category filtering in the home screen

### Custom Widgets
- All reusable widgets are in the `widgets/` folder
- Follow the existing naming convention
- Ensure widgets are responsive and theme-aware

## 📱 Platform Support

- ✅ **Android** - Fully supported
- ✅ **iOS** - Fully supported  
- ✅ **Web** - Responsive web version
- ✅ **Desktop** - Windows, macOS, Linux

## 🔮 Future Enhancements

- **Cloud Sync** - Sync posts across devices
- **Export Options** - Export posts as PDF/Markdown
- **Social Sharing** - Share posts on social media
- **Comments System** - Add comments to posts
- **Media Gallery** - Better image management
- **Backup & Restore** - Data backup functionality

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 🐛 Bug Reports

If you find a bug, please create an issue with:
- Clear description of the problem
- Steps to reproduce
- Expected behavior
- Screenshots (if applicable)
- Device/platform information

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Nahian Ether**
- **Company:** AKIJ iBOS Limited
- **Location:** Dhaka, Bangladesh
- **GitHub:** [@Nahianether](https://github.com/Nahianether)
- **Portfolio:** [portfolio.int8bit.xyz](https://portfolio.int8bit.xyz/)
- **LinkedIn:** [nahinxp21](https://www.linkedin.com/in/nahinxp21/)

## 🙏 Acknowledgments

- Built with Flutter framework by Google
- Inspired by modern blogging platforms
- Thanks to the Flutter community for awesome packages

---

*Share your thoughts, ideas, and experiences through this personal blog app. Perfect for developers, writers, and anyone who loves to document their journey!*
