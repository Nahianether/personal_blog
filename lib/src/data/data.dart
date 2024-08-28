import '../model/blog.model.dart';

final List<BlogModel> blogData = [
  BlogModel(
    category: 'OOP Concepts',
    subCategory: [
      BlogModel(
        category: 'Class',
        content: [
          'Definition: A class is a blueprint or prototype that defines the variables and the methods (functions) common to all objects of a certain kind.',
          'Key Points: Classes in Dart are defined using the class keyword. A class can contain fields, constructors, methods, getters, setters, and operators.',
        ],
      ),
      BlogModel(
        category: 'Object',
        content: [
          'Definition: An object is an instance of a class. It represents an entity that has a state (attributes/fields) and behavior (methods).',
          'Key Points: Objects are created using the new keyword in Dart (optional). Each object can have different values for its attributes.',
        ],
      ),
      BlogModel(
        category: 'Inheritance',
        content: [],
      ),
      BlogModel(
        category: 'Polymorphism',
        content: [],
      ),
      BlogModel(
        category: 'Abstraction',
        content: [],
      ),
      BlogModel(
        category: 'Encapsulation',
        content: [],
      ),
    ],
    content: [],
  ),
  BlogModel(
    category: 'Android Lifecycle',
    subCategory: [],
    content: [
      'onCreate: called when the activity is first created.',
      'onStart: called when the activity becomes visible to the user.',
      'onResume: called when the activity starts interacting with the user.',
      'onPause: called when activity is not visible to the user.',
      'onStop: called when activity is no longer visible to the user.',
      'onDestroy: called after your activity is stopped, before starting.',
      'onRestart: called before the activity was destroyed.',
    ],
  ),
  BlogModel(
    category: 'SOLID Principles',
    subCategory: [],
    content: [],
  ),
  BlogModel(
    category: 'Flutter Concepts',
    subCategory: [
      BlogModel(
        category: 'Widget Tree',
        content: [],
      ),
      BlogModel(
        category: 'Hot Reload vs. Hot Restart',
        content: [],
      ),
      BlogModel(
        category: 'Design Patterns',
        content: [],
      ),
      BlogModel(
        category: 'Stream',
        content: [],
      ),
      BlogModel(
        category: 'Future',
        content: [],
      ),
      BlogModel(
        category: 'Isolates',
        content: [],
      ),
      BlogModel(
        category: 'Method Channels',
        content: [],
      ),
    ],
    content: [],
  ),
  BlogModel(
    category: 'Flutter Animations',
    subCategory: [
      BlogModel(
        category: 'AnimationController',
        content: [],
      ),
      BlogModel(
        category: 'Tween',
        content: [],
      ),
      BlogModel(
        category: 'CurvedAnimation',
        content: [],
      ),
      BlogModel(
        category: 'AnimatedBuilder',
        content: [],
      ),
      BlogModel(
        category: 'Transform',
        content: [],
      ),
      BlogModel(
        category: 'AnimatedWidget',
        content: [],
      ),
      BlogModel(
        category: 'AnimatedContainer',
        content: [],
      ),
      BlogModel(
        category: 'AnimationListener',
        content: [],
      ),
      BlogModel(
        category: 'Custom Painter',
        content: [],
      ),
    ],
    content: [],
  ),
  BlogModel(
    category: 'Flutter State Management',
    subCategory: [
      BlogModel(
        category: 'SetState',
        content: [],
      ),
      BlogModel(
        category: 'Provider',
        content: [],
      ),
      BlogModel(
        category: 'Riverpod',
        content: [],
      ),
      BlogModel(
        category: 'Bloc',
        content: [],
      ),
      BlogModel(
        category: 'GetX',
        content: [],
      ),
    ],
    content: [],
  ),
  BlogModel(
    category: 'Flutter Database',
    subCategory: [
      BlogModel(
        category: 'Shared Preferences',
        content: [],
      ),
      BlogModel(
        category: 'Hive and Isar',
        content: [],
      ),
      BlogModel(
        category: 'SQFlite',
        content: [],
      ),
    ],
    content: [],
  ),
  BlogModel(
    category: 'Google Map',
    subCategory: [],
    content: [],
  ),
];
