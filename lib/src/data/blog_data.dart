import '../models/blog_models.dart';

class BlogData {
  static List<Category> get categories => [
    Category(
      id: 'oop',
      name: 'OOP Concepts',
      description: 'Object-Oriented Programming fundamentals',
      icon: '🧩',
      color: '#3B82F6',
      language: 'flutter',
      subCategories: ['Class', 'Object', 'Inheritance', 'Polymorphism', 'Abstraction', 'Encapsulation'],
    ),
    Category(
      id: 'solid',
      name: 'SOLID Principles',
      description: 'Design principles for maintainable code',
      icon: '🏗️',
      color: '#10B981',
      language: 'flutter',
      subCategories: ['Single Responsibility', 'Open/Closed', 'Liskov Substitution', 'Interface Segregation', 'Dependency Inversion'],
    ),
    Category(
      id: 'android',
      name: 'Android Lifecycle',
      description: 'Android application lifecycle methods',
      icon: '🤖',
      color: '#F59E0B',
      language: 'flutter',
      subCategories: ['onCreate', 'onStart', 'onResume', 'onPause', 'onStop', 'onDestroy'],
    ),
    Category(
      id: 'flutter-core',
      name: 'Flutter Core',
      description: 'Essential Flutter concepts and widgets',
      icon: '🎯',
      color: '#06B6D4',
      language: 'flutter',
      subCategories: ['Widget Tree', 'Streams', 'Isolates', 'Hot Reload'],
    ),
    Category(
      id: 'state-management',
      name: 'State Management',
      description: 'Flutter state management solutions',
      icon: '⚡',
      color: '#8B5CF6',
      language: 'flutter',
      subCategories: ['Provider', 'Riverpod', 'BLoC', 'GetX'],
    ),
    Category(
      id: 'data-persistence',
      name: 'Data Persistence',
      description: 'Local storage and database solutions',
      icon: '💾',
      color: '#EF4444',
      language: 'flutter',
      subCategories: ['Hive', 'Isar', 'SQLite', 'SharedPreferences'],
    ),
    Category(
      id: 'advanced',
      name: 'Advanced Features',
      description: 'Advanced Flutter concepts and integrations',
      icon: '🚀',
      color: '#F97316',
      language: 'flutter',
      subCategories: ['Method Channels', 'Go Router', 'Firebase', 'Google Maps'],
    ),
    Category(
      id: 'animations',
      name: 'Animations',
      description: 'Flutter animation system',
      icon: '🎭',
      color: '#EC4899',
      language: 'flutter',
      subCategories: ['AnimationController', 'Tween', 'Custom Animations'],
    ),
    Category(
      id: 'testing',
      name: 'Testing',
      description: 'Testing strategies and best practices',
      icon: '🧪',
      color: '#14B8A6',
      language: 'flutter',
      subCategories: ['Unit Testing', 'Widget Testing', 'Integration Testing'],
    ),
    Category(
      id: 'patterns',
      name: 'Design Patterns',
      description: 'Common design patterns in Flutter',
      icon: '🏛️',
      color: '#6366F1',
      language: 'flutter',
      subCategories: ['Singleton', 'Factory', 'Observer', 'Repository'],
    ),
    Category(
      id: 'performance',
      name: 'Performance',
      description: 'Optimization techniques and best practices',
      icon: '⚡',
      color: '#84CC16',
      language: 'flutter',
      subCategories: ['Firestore Optimization', 'Memory Management', 'Build Optimization'],
    ),
  ];

  static List<BlogPost> get posts => [
    BlogPost(
      id: 'class-concept',
      title: 'Understanding Classes in Dart',
      content: '''# Class in Dart

## Definition
A class is a blueprint or prototype that defines the variables and the methods (functions) common to all objects of a certain kind.

## Key Points
- Classes in Dart are defined using the `class` keyword
- A class can contain fields, constructors, methods, getters, setters, and operators
- Classes serve as templates for creating objects

## Example
```dart
class Person {
  String name;
  int age;
  
  Person(this.name, this.age);
  
  void introduce() {
    print('Hi, I am \$name and I am \$age years old.');
  }
}
```

## Best Practices
1. Use PascalCase for class names
2. Keep classes focused on a single responsibility
3. Use meaningful names that describe the purpose
4. Consider using const constructors when appropriate
''',
      category: 'OOP Concepts',
      tags: ['class', 'oop', 'dart', 'basics'],
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      updatedAt: DateTime.now().subtract(const Duration(days: 5)),
      readTimeMinutes: 5,
      excerpt: 'Learn the fundamentals of classes in Dart programming language',
      codeExamples: [
        CodeExample(
          title: 'Basic Class Definition',
          code: '''class Person {
  String name;
  int age;
  
  Person(this.name, this.age);
  
  void introduce() {
    print('Hi, I am \$name and I am \$age years old.');
  }
}''',
          language: 'dart',
          explanation: 'A simple class with properties and methods',
        ),
      ],
      interviewQuestions: [
        InterviewQuestion(
          question: 'What is a class in Dart?',
          answer: 'A class is a blueprint that defines the structure and behavior of objects. It contains fields, methods, and constructors.',
          type: QuestionType.theoretical,
          difficulty: DifficultyLevel.beginner,
        ),
        InterviewQuestion(
          question: 'How do you define a class in Dart?',
          answer: 'Use the class keyword followed by the class name and body enclosed in curly braces.',
          type: QuestionType.practical,
          difficulty: DifficultyLevel.beginner,
        ),
      ],
      difficulty: DifficultyLevel.beginner,
      language: 'flutter',
      relatedTopics: ['object-concept', 'inheritance-concept', 'constructor-concept'],
    ),
    
    BlogPost(
      id: 'object-concept',
      title: 'Objects: Instances of Classes',
      content: '''# Object in Dart

## Definition
An object is an instance of a class. It represents an entity that has a state (attributes/fields) and behavior (methods).

## Key Points
- Objects are created using the `new` keyword in Dart (optional)
- Each object can have different values for its attributes
- Objects contain both data and methods to manipulate that data

## Creating Objects
```dart
// Creating an object
Person person1 = Person('John', 25);
// or
Person person2 = new Person('Jane', 30);
```

## Object Characteristics
1. **State**: The data stored in the object
2. **Behavior**: The methods that operate on the data
3. **Identity**: Each object has a unique identity

## Memory Management
- Objects are stored in heap memory
- Dart has automatic garbage collection
- Objects are automatically cleaned up when no longer referenced
''',
      category: 'OOP Concepts',
      tags: ['object', 'oop', 'dart', 'instance'],
      createdAt: DateTime.now().subtract(const Duration(days: 29)),
      updatedAt: DateTime.now().subtract(const Duration(days: 4)),
      readTimeMinutes: 4,
      excerpt: 'Understanding objects as instances of classes in Dart',
      codeExamples: [
        CodeExample(
          title: 'Creating and Using Objects',
          code: '''class Car {
  String brand;
  String model;
  int year;
  
  Car(this.brand, this.model, this.year);
  
  void start() {
    print('\$brand \$model is starting...');
  }
}

void main() {
  Car car1 = Car('Toyota', 'Camry', 2023);
  Car car2 = Car('Honda', 'Civic', 2022);
  
  car1.start();
  car2.start();
}''',
          language: 'dart',
          explanation: 'Creating multiple objects from the same class',
        ),
      ],
      interviewQuestions: [
        InterviewQuestion(
          question: 'What is the difference between a class and an object?',
          answer: 'A class is a blueprint or template, while an object is an instance of that class with actual values.',
          type: QuestionType.theoretical,
          difficulty: DifficultyLevel.beginner,
        ),
      ],
      difficulty: DifficultyLevel.beginner,
      language: 'flutter',
      relatedTopics: ['class-concept', 'constructor-concept', 'memory-management'],
    ),
    
    BlogPost(
      id: 'inheritance-concept',
      title: 'Inheritance: Code Reusability',
      content: '''# Inheritance in Dart

## Definition
Inheritance allows a new class to inherit the properties and methods of an existing class.

## Key Points
- Dart supports single inheritance (one superclass)
- Use the `extends` keyword to implement inheritance
- Child classes can override parent methods
- Use `super` keyword to access parent class members

## Types of Inheritance

### 1. Single Inheritance
When one class inherits from another class.

### 2. Hierarchical Inheritance
Multiple classes inherit from a single parent class.

### 3. Multilevel Inheritance
A class inherits from another derived class.

### 4. Hybrid Inheritance
Combination of multiple inheritance types (not directly supported in Dart).

## Example
```dart
class Animal {
  String name;
  
  Animal(this.name);
  
  void eat() {
    print('\$name is eating');
  }
}

class Dog extends Animal {
  String breed;
  
  Dog(String name, this.breed) : super(name);
  
  void bark() {
    print('\$name is barking');
  }
  
  @override
  void eat() {
    print('\$name (a \$breed) is eating dog food');
  }
}
```

## Benefits
- Code reusability
- Establishes relationship between classes
- Supports method overriding
- Enables polymorphism
''',
      category: 'OOP Concepts',
      tags: ['inheritance', 'oop', 'dart', 'extends'],
      createdAt: DateTime.now().subtract(const Duration(days: 28)),
      updatedAt: DateTime.now().subtract(const Duration(days: 3)),
      readTimeMinutes: 8,
      excerpt: 'Master inheritance concepts and implement code reusability in Dart',
      codeExamples: [
        CodeExample(
          title: 'Single Inheritance Example',
          code: '''class Vehicle {
  String brand;
  int year;
  
  Vehicle(this.brand, this.year);
  
  void start() {
    print('\$brand vehicle is starting');
  }
}

class Car extends Vehicle {
  int doors;
  
  Car(String brand, int year, this.doors) : super(brand, year);
  
  @override
  void start() {
    print('\$brand car with \$doors doors is starting');
  }
  
  void honk() {
    print('Car is honking');
  }
}''',
          language: 'dart',
          explanation: 'Demonstrating single inheritance with method overriding',
        ),
      ],
      interviewQuestions: [
        InterviewQuestion(
          question: 'What is inheritance in Dart?',
          answer: 'Inheritance is a mechanism where a class can inherit properties and methods from another class using the extends keyword.',
          type: QuestionType.theoretical,
          difficulty: DifficultyLevel.intermediate,
        ),
        InterviewQuestion(
          question: 'Does Dart support multiple inheritance?',
          answer: 'No, Dart supports single inheritance only. A class can extend only one superclass.',
          type: QuestionType.theoretical,
          difficulty: DifficultyLevel.intermediate,
        ),
      ],
      difficulty: DifficultyLevel.intermediate,
      language: 'flutter',
      relatedTopics: ['class-concept', 'polymorphism-concept', 'method-overriding'],
    ),
    
    BlogPost(
      id: 'polymorphism-concept',
      title: 'Polymorphism: One Interface, Multiple Forms',
      content: '''# Polymorphism in Dart

## Definition
Polymorphism allows objects to be treated as instances of their parent class or interface. It enables one interface to be used for a general class of actions.

## Key Points
- Polymorphism is implemented using method overriding and method overloading
- A single function, method, or object can behave differently based on context
- Supports both compile-time and runtime polymorphism

## Types of Polymorphism

### 1. Compile Time Polymorphism (Static)
- Method Overloading (not directly supported in Dart)
- Operator Overloading

### 2. Runtime Polymorphism (Dynamic)
- Method Overriding
- Interface implementation

## Method Overriding vs Method Overloading

### Method Overriding
- Occurs when a subclass provides a specific implementation of a method from its superclass
- Uses `@override` annotation
- Runtime polymorphism

### Method Overloading
- Multiple methods with same name but different parameters
- Not directly supported in Dart
- Can be achieved using optional parameters

## Example
```dart
abstract class Shape {
  double calculateArea();
  void draw();
}

class Circle extends Shape {
  double radius;
  
  Circle(this.radius);
  
  @override
  double calculateArea() => 3.14 * radius * radius;
  
  @override
  void draw() => print('Drawing a circle');
}

class Rectangle extends Shape {
  double width, height;
  
  Rectangle(this.width, this.height);
  
  @override
  double calculateArea() => width * height;
  
  @override
  void draw() => print('Drawing a rectangle');
}
```

## Benefits
- Code flexibility and reusability
- Easier maintenance
- Runtime method resolution
- Supports abstraction
''',
      category: 'OOP Concepts',
      tags: ['polymorphism', 'oop', 'dart', 'override'],
      createdAt: DateTime.now().subtract(const Duration(days: 27)),
      updatedAt: DateTime.now().subtract(const Duration(days: 2)),
      readTimeMinutes: 10,
      excerpt: 'Learn how polymorphism enables flexible and reusable code design',
      codeExamples: [
        CodeExample(
          title: 'Runtime Polymorphism Example',
          code: '''abstract class Animal {
  String name;
  Animal(this.name);
  
  void makeSound();
  void move();
}

class Dog extends Animal {
  Dog(String name) : super(name);
  
  @override
  void makeSound() => print('\$name barks');
  
  @override
  void move() => print('\$name runs');
}

class Cat extends Animal {
  Cat(String name) : super(name);
  
  @override
  void makeSound() => print('\$name meows');
  
  @override
  void move() => print('\$name walks silently');
}

void main() {
  List<Animal> animals = [
    Dog('Rex'),
    Cat('Whiskers'),
    Dog('Buddy')
  ];
  
  for (Animal animal in animals) {
    animal.makeSound(); // Polymorphic behavior
    animal.move();
  }
}''',
          language: 'dart',
          explanation: 'Demonstrating runtime polymorphism with different animal types',
        ),
      ],
      interviewQuestions: [
        InterviewQuestion(
          question: 'What is polymorphism in Dart?',
          answer: 'Polymorphism allows objects to be treated as instances of their parent class, enabling one interface to be used for different underlying data types.',
          type: QuestionType.theoretical,
          difficulty: DifficultyLevel.intermediate,
        ),
        InterviewQuestion(
          question: 'Explain method overriding in Dart.',
          answer: 'Method overriding occurs when a subclass provides a specific implementation of a method that is already defined in its superclass. Use @override annotation.',
          type: QuestionType.practical,
          difficulty: DifficultyLevel.intermediate,
        ),
      ],
      difficulty: DifficultyLevel.intermediate,
      language: 'flutter',
      relatedTopics: ['inheritance-concept', 'abstract-classes', 'interfaces'],
    ),
    
    BlogPost(
      id: 'provider-state-management',
      title: 'Provider: Simple State Management',
      content: '''# Provider in Flutter

## Overview
Provider is a popular state management solution in Flutter based on InheritedWidget. It makes it easier to manage and share state across different parts of your application.

## Types of Providers

### 1. Provider
- Simplest form for providing objects that don't change
- Used for services, configurations, or immutable data

### 2. ChangeNotifierProvider
- Used for classes that extend ChangeNotifier
- Automatically listens to changes and rebuilds dependent widgets
- Common for mutable state management

### 3. StateProvider
- Simple provider for primitive values
- Provides mutable state that can be updated and observed

### 4. FutureProvider
- Used for asynchronous data
- Listens to a Future and updates UI when complete

### 5. StreamProvider
- Listens to a Stream and provides the latest value
- Useful for real-time data or continuous data flow

## Example Implementation
```dart
class CounterModel extends ChangeNotifier {
  int _count = 0;
  
  int get count => _count;
  
  void increment() {
    _count++;
    notifyListeners();
  }
  
  void decrement() {
    _count--;
    notifyListeners();
  }
}

// Usage
ChangeNotifierProvider(
  create: (context) => CounterModel(),
  child: Consumer<CounterModel>(
    builder: (context, counter, child) {
      return Text('Count: \${counter.count}');
    },
  ),
)
```

## Best Practices
1. Use appropriate provider types for your use case
2. Keep providers focused and single-purpose
3. Use Consumer for rebuilding specific widgets
4. Consider using Selector for performance optimization
5. Don't put providers too high in the widget tree
''',
      category: 'State Management',
      tags: ['provider', 'state-management', 'flutter', 'changenotifier'],
      createdAt: DateTime.now().subtract(const Duration(days: 20)),
      updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      readTimeMinutes: 12,
      excerpt: 'Learn Provider for simple and effective state management in Flutter',
      codeExamples: [
        CodeExample(
          title: 'Complete Provider Example',
          code: '''class ShoppingCart extends ChangeNotifier {
  final List<String> _items = [];
  
  List<String> get items => _items;
  int get itemCount => _items.length;
  
  void addItem(String item) {
    _items.add(item);
    notifyListeners();
  }
  
  void removeItem(String item) {
    _items.remove(item);
    notifyListeners();
  }
  
  void clear() {
    _items.clear();
    notifyListeners();
  }
}

class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShoppingCart(),
      child: MaterialApp(
        home: ShoppingScreen(),
      ),
    );
  }
}

class ShoppingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        actions: [
          Consumer<ShoppingCart>(
            builder: (context, cart, child) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text('\${cart.itemCount}'),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<ShoppingCart>(
        builder: (context, cart, child) {
          return ListView.builder(
            itemCount: cart.itemCount,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(cart.items[index]),
                trailing: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    cart.removeItem(cart.items[index]);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ShoppingCart>(context, listen: false)
              .addItem('Item \${DateTime.now().millisecondsSinceEpoch}');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}''',
          language: 'dart',
          explanation: 'Complete shopping cart example using Provider',
        ),
      ],
      interviewQuestions: [
        InterviewQuestion(
          question: 'What is Provider in Flutter?',
          answer: 'Provider is a state management solution built on top of InheritedWidget that makes it easier to manage and share state across the widget tree.',
          type: QuestionType.theoretical,
          difficulty: DifficultyLevel.intermediate,
        ),
        InterviewQuestion(
          question: 'When should you use ChangeNotifierProvider?',
          answer: 'Use ChangeNotifierProvider when you need to manage mutable state that can change over time and notify listeners about those changes.',
          type: QuestionType.practical,
          difficulty: DifficultyLevel.intermediate,
        ),
      ],
      difficulty: DifficultyLevel.intermediate,
      language: 'flutter',
      relatedTopics: ['riverpod-state-management', 'bloc-pattern', 'state-management-comparison'],
    ),
    
    // Add more blog posts here following the same pattern...
  ];
}