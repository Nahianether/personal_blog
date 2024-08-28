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
        content: [
          'Definition: Inheritance allows a new class to inherit the properties and methods of an existing class.',
          'Key Points: Dart supports single inheritance, where a class can inherit from one superclass. Use the extends keyword to implement inheritance.',
          '',
          'Type Of Inheritance:',
          'Single Inheritance: When one class inherits another class, it is known as single-level inheritance.',
          'Hierarchical Inheritance: Hierarchical inheritance is defined as the process of deriving more than one class from a base class.',
          'Multilevel inheritance: Multilevel inheritance is a process of deriving a class from another derived class.',
          'Hybrid inheritance: Hybrid inheritance is a combination of simple, multiple inheritance and hierarchical inheritance(does not Support in Dart).',
        ],
      ),
      BlogModel(
        category: 'Polymorphism',
        content: [
          'Definition: Polymorphism allows objects to be treated as instances of their parent class or interface. It enables one interface to be used for a general class of actions.',
          'Key Points: Polymorphism is implemented using method overriding and method overloading.',
          '',
          '(In simple terms, a single function, method, or object can behave differently based on the context. For example, a function that adds two numbers might also be used to concatenate two strings.)',
          '',
          'Types of Polymorphism:',
          'Compile Time Polymorphism (Static): The polymorphism which is implemented at the compile time is known as compile-time polymorphism. Example - Method Overloading',
          'Runtime Polymorphism (Dynamic): Runtime polymorphism is also known as dynamic polymorphism. Function Overriding is an example of runtime polymorphism.',
        ],
      ),
      BlogModel(
        category: 'Method Overloading vs. Method Overriding',
        content: [
          'Method Overloading:',
          'Occurs when two or more methods in the same class have the same name but different parameters.',
          'Note: Dart does not support method overloading directly.',
          '',
          'Method Overriding:',
          'Occurs when a subclass provides a specific implementation of a method that is already defined in its superclass.',
        ],
      ),
      BlogModel(
        category: 'Abstraction',
        content: [
          'Definition: Abstraction is the process of hiding the implementation details and showing only the functionality to the user.',
          'Key Points: Achieved using abstract classes and interfaces in Dart.',
          '',
          'Types of Abstraction:',
          'Abstract Class',
          'Interfaces (Pure Abstraction)',
        ],
      ),
      BlogModel(
        category: 'Encapsulation',
        content: [
          'Definition: Encapsulation is the mechanism of wrapping the data (variables) and the code acting on the data (methods) together as a single unit.',
          'Key Points: Data hiding is achieved using private fields and public methods. Dart uses the underscore (_) to mark a field as private.',
          '(In simpler words, attributes of the class are kept private or public-getter, and setter methods are provided to manipulate these attributes.)',
        ],
      ),
      BlogModel(
        category: 'Getters and Setters',
        content: [
          'Definition: Getters and setters are special methods that provide read and write access to an object\'s properties.',
        ],
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
    content: [
      'The SOLID principles are a set of design guidelines in object-oriented programming that help developers create more maintainable, scalable, and understandable software.',
      '',
      'Single Responsibility Principle: A class should have only one reason to change.',
      'Open/Closed Principle: Software entities should be open for extension, but closed for modification.',
      'Liskov Substitution Principle: Objects of a superclass should be replaceable with objects of a subclass without affecting the correctness of the program.',
      'Interface Segregation Principle: Clients should not be forced to depend on methods they do not use.',
      'Dependency Inversion Principle: High-level modules should not depend on low-level modules; both should depend on abstractions.',
    ],
  ),
  BlogModel(
    category: 'Flutter Concepts',
    subCategory: [
      BlogModel(
        category: 'Widget Tree',
        content: [
          'Basic Widget Tree Structure',
          'runApp -> MaterialApp or CupertinoApp -> Scaffold',
          '',
          'Nested Widget Tree',
          'Container, Row or Column, TextStyle',
          '',
          'Stateful Widget Tree',
          '',
          'Understanding the Flutter Widget Tree Lifecycle',
          'The widget tree in Flutter is dynamic. Depending on how the user interacts with the app or how data changes, the tree may be rebuilt or updated (Build Method, Rebuilding).',
        ],
      ),
      BlogModel(
        category: 'Hot Reload vs. Hot Restart',
        content: [
          'Hot Reload',
          'Purpose: Quickly refreshes the UI while preserving the app’s state.',
          'Speed: Very fast; typically takes less than a second.',
          'Use Case: Ideal for minor UI changes, tweaking styles, or updating small parts of the app.',
          'Impact: Only updates the code that has changed, keeping the app state intact.',
          '',
          'Hot Restart',
          'Purpose: Restarts the entire app, clearing all states and reloading the app from scratch.',
          'Speed: Slower compared to Hot Reload.',
          'Use Case: Needed when making significant changes like altering app-level state, adding new dependencies, or initializing new code.',
          'Impact: Rebuilds the whole app, resetting it to the initial state.',
          '',
          'In summary, Hot Reload is used for quick, iterative development, while Hot Restart is for more significant code changes that require a fresh start of the app.',
        ],
      ),
      BlogModel(
        category: 'Design Patterns',
        content: [
          'Design patterns help in writing clean, reusable, and maintainable code:',
          '',
          'Singleton: Ensures a class has only one instance and provides a global point of access to it. Used for managing resources like database connections.',
          'Factory: Provides a way to create objects without specifying the exact class of the object that will be created. Useful in large-scale applications where object creation logic is complex.',
          'Observer: A pattern where an object, known as the subject, maintains a list of its dependents, called observers, and notifies them of any state changes. This pattern is useful in scenarios like event listeners or real-time data updates.',
        ],
      ),
      BlogModel(
        category: 'Stream',
        content: [
          'Stream is a way to receive asynchronous data events over time. It\'s a fundamental concept used for handling sequences of data that are received asynchronously. Streams are particularly useful when you need to handle multiple pieces of data that arrive at different times, such as user input, sensor data, or real-time updates from a network service.',
          '',
        ],
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
        content: [
          'Purpose: Manages the timing and state of an animation.',
        ],
      ),
      BlogModel(
        category: 'Tween',
        content: [
          'Purpose: Defines the range of values that an animation can interpolate between.',
        ],
      ),
      BlogModel(
        category: 'CurvedAnimation',
        content: [
          'Purpose: Adds a curve to the animation, making it non-linear (e.g., easing in, easing out).',
        ],
      ),
      BlogModel(
        category: 'AnimatedBuilder',
        content: [
          'Purpose: Rebuilds the widget tree when the animation\'s value changes.',
        ],
      ),
      BlogModel(
        category: 'Transform',
        content: [
          'Purpose: Transforms the child widget using various transformations like translation, rotation, scaling, etc.',
        ],
      ),
      BlogModel(
        category: 'AnimatedWidget',
        content: [
          'Purpose: Simplifies the process of creating animations by reducing boilerplate code.',
        ],
      ),
      BlogModel(
        category: 'AnimatedContainer',
        content: [
          'Purpose: A built-in widget that automatically animates changes to its properties over time.',
        ],
      ),
      BlogModel(
        category: 'AnimationListener',
        content: [
          'Purpose: Allows you to add callbacks for different states of the animation, such as when it starts, stops, or repeats.',
        ],
      ),
      BlogModel(
        category: 'Custom Painter',
        content: [
          'Purpose: For creating complex, custom graphics and animations by manually painting on a canvas.',
        ],
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
