import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OOPContentScreen extends StatelessWidget {
  const OOPContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Color(0xFF00BCD4),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.design_services,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'OOP Concepts',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF00BCD4), Color(0xFF0097A7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Master OOP Concepts',
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Learn fundamental object-oriented programming principles',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Course Overview
            _buildContentSection(
              'Course Overview',
              'Master Object-Oriented Programming concepts with Dart. Learn the fundamental principles that make code maintainable, scalable, and reusable.',
              [],
              showBullets: false,
            ),

            const SizedBox(height: 32),

            // Core OOP Concepts
            _buildModuleCard(
              'Core OOP Concepts',
              'Fundamental building blocks of object-oriented programming',
              [
                'Classes and Objects',
                'Inheritance',
                'Polymorphism',
                'Abstraction',
                'Encapsulation',
              ],
              const Color(0xFF3498DB),
              Icons.architecture,
            ),

            const SizedBox(height: 24),

            // Class Deep Dive
            _buildTopicCard(
              'Classes & Objects',
              'Understanding the blueprint and instances in OOP',
              _buildClassObjectContent(),
            ),

            const SizedBox(height: 24),

            // Inheritance Deep Dive
            _buildTopicCard(
              'Inheritance',
              'Code reusability through parent-child relationships',
              _buildInheritanceContent(),
            ),

            const SizedBox(height: 24),

            // Polymorphism Deep Dive
            _buildTopicCard(
              'Polymorphism',
              'One interface, multiple implementations',
              _buildPolymorphismContent(),
            ),

            const SizedBox(height: 24),

            // Abstraction Deep Dive
            _buildTopicCard(
              'Abstraction',
              'Hiding implementation details and showing functionality',
              _buildAbstractionContent(),
            ),

            const SizedBox(height: 24),

            // Encapsulation Deep Dive
            _buildTopicCard(
              'Encapsulation',
              'Data hiding and controlled access',
              _buildEncapsulationContent(),
            ),

            const SizedBox(height: 24),

            // SOLID Principles
            _buildTopicCard(
              'SOLID Principles',
              'Design principles for maintainable and scalable code',
              _buildSOLIDContent(),
            ),

            const SizedBox(height: 24),

            // Design Patterns
            _buildTopicCard(
              'Design Patterns',
              'Common solutions to recurring design problems in software development',
              _buildDesignPatternsContent(),
            ),

            const SizedBox(height: 24),

            // Getters and Setters
            _buildTopicCard(
              'Getters and Setters',
              'Controlled access to class properties with validation',
              _buildGettersSettersContent(),
            ),

            const SizedBox(height: 24),

            // Abstract Classes
            _buildTopicCard(
              'Abstract Classes',
              'Classes that cannot be instantiated and serve as base templates',
              _buildAbstractClassesContent(),
            ),

            const SizedBox(height: 24),

            // Interfaces
            _buildTopicCard(
              'Interfaces',
              'Contracts that define what methods a class must implement',
              _buildInterfacesContent(),
            ),

            const SizedBox(height: 24),

            // Dependency Injection
            _buildTopicCard(
              'Dependency Injection',
              'Design pattern for achieving loose coupling between classes',
              _buildDependencyInjectionContent(),
            ),

            const SizedBox(height: 24),

            // CRUD Operations
            _buildTopicCard(
              'CRUD Operations',
              'Create, Read, Update, Delete - fundamental data operations',
              _buildCRUDContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentSection(String title, String description, List<String> items, {bool showBullets = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white70,
            height: 1.5,
          ),
        ),
        if (showBullets && items.isNotEmpty) ...[
          const SizedBox(height: 20),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFF00BCD4),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ],
    );
  }

  Widget _buildModuleCard(String title, String description, List<String> topics, Color color, IconData icon) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF2C3E50),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: topics
                .map((topic) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: color.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        topic,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: color,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicCard(String title, String description, Widget content) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF2C3E50),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF00BCD4).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF00BCD4).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.school,
                  color: Color(0xFF00BCD4),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          content,
        ],
      ),
    );
  }

  Widget _buildClassObjectContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Class Definition',
          'A class is a blueprint or prototype that defines the variables and the methods (functions) common to all objects of a certain kind.',
        ),
        const SizedBox(height: 20),
        _buildDefinitionBox(
          'Object Definition',
          'An object is an instance of a class. It represents an entity that has a state (attributes/fields) and behavior (methods).',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Class and Object Example',
          '''class Person {
  String name;
  int age;
  
  Person(this.name, this.age);
  
  void introduce() {
    print('Hi, I am \$name and I am \$age years old.');
  }
}

void main() {
  // Creating objects
  Person person1 = Person('John', 25);
  Person person2 = new Person('Jane', 30); // 'new' is optional
  
  person1.introduce();
  person2.introduce();
}''',
          'Classes in Dart are defined using the class keyword. Objects are created with or without the new keyword.',
        ),
        const SizedBox(height: 16),
        _buildKeyPoints([
          'Classes can contain fields, constructors, methods, getters, setters, and operators',
          'Each object can have different values for its attributes',
          'Objects contain both data and methods to manipulate that data',
          'Use PascalCase for class names (e.g., Person, BankAccount)',
        ]),
      ],
    );
  }

  Widget _buildInheritanceContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Inheritance Definition',
          'Inheritance allows a new class to inherit the properties and methods of an existing class.',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Inheritance Example',
          '''class Animal {
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
}''',
          'Use the extends keyword to implement inheritance. Child classes can override parent methods.',
        ),
        const SizedBox(height: 20),
        _buildInheritanceTypes(),
        const SizedBox(height: 16),
        _buildKeyPoints([
          'Dart supports single inheritance (one superclass)',
          'Use the extends keyword to implement inheritance',
          'Child classes can override parent methods using @override',
          'Use super keyword to access parent class members',
        ]),
      ],
    );
  }

  Widget _buildPolymorphismContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Polymorphism Definition',
          'Polymorphism allows objects to be treated as instances of their parent class or interface. It enables one interface to be used for a general class of actions.',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Runtime Polymorphism Example',
          '''abstract class Shape {
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

void main() {
  List<Shape> shapes = [Circle(5), Rectangle(4, 6)];
  
  for (Shape shape in shapes) {
    shape.draw(); // Polymorphic behavior
    print('Area: \${shape.calculateArea()}');
  }
}''',
          'Same interface (Shape) used for different implementations (Circle, Rectangle).',
        ),
        const SizedBox(height: 20),
        _buildPolymorphismTypes(),
        const SizedBox(height: 16),
        _buildKeyPoints([
          'One interface used for different underlying data types',
          'Implemented using method overriding and method overloading',
          'Runtime method resolution provides flexibility',
          'Enables code reusability and easier maintenance',
        ]),
      ],
    );
  }

  Widget _buildAbstractionContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Abstraction Definition',
          'Abstraction is the process of hiding the implementation details and showing only the functionality to the user.',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Abstract Class Example - Hive CRUD',
          '''import 'package:hive/hive.dart';

abstract class HiveCrudService<T> {
  final String boxName;
  HiveCrudService(this.boxName);

  Future<Box<T>> openBox() async {
    return await Hive.openBox<T>(boxName);
  }

  Future<void> create(T item) async {
    final box = await openBox();
    await box.add(item);
  }

  Future<List<T>> readAll() async {
    final box = await openBox();
    return box.values.toList();
  }

  Future<void> update(int key, T item) async {
    final box = await openBox();
    await box.put(key, item);
  }

  Future<void> delete(int key) async {
    final box = await openBox();
    await box.delete(key);
  }
}

// Implementation for specific type
class UserCrudService extends HiveCrudService<User> {
  UserCrudService() : super('userBox');
}''',
          'Abstract classes provide a common interface while hiding implementation details.',
        ),
        const SizedBox(height: 20),
        _buildAbstractionBenefits(),
        const SizedBox(height: 16),
        _buildKeyPoints([
          'Achieved using abstract classes and interfaces in Dart',
          'Separates high-level design from low-level implementation',
          'Provides flexibility in changing implementations',
          'Enables code reusability across different models',
        ]),
      ],
    );
  }

  Widget _buildEncapsulationContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Encapsulation Definition',
          'Encapsulation is the mechanism of wrapping the data (variables) and the code acting on the data (methods) together as a single unit.',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Encapsulation with Getters and Setters',
          '''class BankAccount {
  String _accountNumber; // Private field
  double _balance;       // Private field
  
  BankAccount(this._accountNumber, this._balance);
  
  // Getter methods
  String get accountNumber => _accountNumber;
  double get balance => _balance;
  
  // Setter method with validation
  set balance(double newBalance) {
    if (newBalance >= 0) {
      _balance = newBalance;
    } else {
      throw ArgumentError('Balance cannot be negative');
    }
  }
  
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    }
  }
  
  bool withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      return true;
    }
    return false;
  }
}''',
          'Data hiding achieved using private fields (_) and controlled access through methods.',
        ),
        const SizedBox(height: 16),
        _buildKeyPoints([
          'Data hiding achieved using the underscore (_) for private fields',
          'Controlled access through public getter and setter methods',
          'Validates data before modification',
          'Prevents direct access to internal state',
        ]),
      ],
    );
  }

  Widget _buildSOLIDContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'SOLID Principles',
          'The SOLID principles are a set of design guidelines in object-oriented programming that help developers create more maintainable, scalable, and understandable software.',
        ),
        const SizedBox(height: 20),
        _buildSOLIDPrinciple('S', 'Single Responsibility Principle', 'A class should have only one reason to change.'),
        const SizedBox(height: 12),
        _buildSOLIDPrinciple('O', 'Open/Closed Principle',
            'Software entities should be open for extension, but closed for modification.'),
        const SizedBox(height: 12),
        _buildSOLIDPrinciple('L', 'Liskov Substitution Principle',
            'Objects of a superclass should be replaceable with objects of a subclass without affecting the correctness of the program.'),
        const SizedBox(height: 12),
        _buildSOLIDPrinciple('I', 'Interface Segregation Principle',
            'Clients should not be forced to depend on methods they do not use.'),
        const SizedBox(height: 12),
        _buildSOLIDPrinciple('D', 'Dependency Inversion Principle',
            'High-level modules should not depend on low-level modules; both should depend on abstractions.'),
      ],
    );
  }

  Widget _buildDefinitionBox(String title, String content) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF34495E),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF00BCD4).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF00BCD4),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeExample(String title, String code, String explanation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          child: Text(
            code,
            style: GoogleFonts.sourceCodePro(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF7FB069),
              height: 1.4,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          explanation,
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.white60,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget _buildKeyPoints(List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Points',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        ...points.map((point) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    margin: const EdgeInsets.only(top: 6),
                    decoration: const BoxDecoration(
                      color: Color(0xFF00BCD4),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      point,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _buildInheritanceTypes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Types of Inheritance',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        _buildInheritanceType('Single Inheritance', 'When one class inherits another class.'),
        _buildInheritanceType('Hierarchical Inheritance', 'Multiple classes inherit from a single base class.'),
        _buildInheritanceType('Multilevel Inheritance', 'A class inherits from another derived class.'),
        _buildInheritanceType(
            'Hybrid Inheritance', 'Combination of multiple inheritance types (not supported in Dart).'),
      ],
    );
  }

  Widget _buildInheritanceType(String type, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 6),
            decoration: const BoxDecoration(
              color: Color(0xFF00BCD4),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
                children: [
                  TextSpan(
                    text: '$type: ',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF00BCD4),
                    ),
                  ),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPolymorphismTypes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Types of Polymorphism',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        _buildPolymorphismType('Compile Time (Static)', 'Method Overloading (not directly supported in Dart)'),
        _buildPolymorphismType('Runtime (Dynamic)', 'Method Overriding - provides specific implementation in subclass'),
      ],
    );
  }

  Widget _buildPolymorphismType(String type, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 6),
            decoration: const BoxDecoration(
              color: Color(0xFF00BCD4),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
                children: [
                  TextSpan(
                    text: '$type: ',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF00BCD4),
                    ),
                  ),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAbstractionBenefits() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Why Use Abstraction?',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        _buildBenefit('Code Reusability',
            'Abstraction allows you to reuse abstract classes by extending them and adding specific functionality.'),
        _buildBenefit('Separation of Concerns',
            'Abstract classes help separate the high-level design (interface) from the low-level details (implementation).'),
        _buildBenefit('Flexibility',
            'Provides flexibility in changing the implementation of concrete classes without affecting the code that uses the abstract class.'),
      ],
    );
  }

  Widget _buildBenefit(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF00BCD4),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSOLIDPrinciple(String letter, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF34495E),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF00BCD4).withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF00BCD4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                letter,
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesignPatternsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Design Patterns',
          'Design patterns are reusable solutions to common problems in software design. They represent best practices evolved over time.',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Singleton Pattern - Ensuring Single Instance',
          '''class DatabaseConnection {
  static DatabaseConnection? _instance;
  static final DatabaseConnection _singleton = DatabaseConnection._internal();
  
  factory DatabaseConnection() {
    return _singleton;
  }
  
  DatabaseConnection._internal();
  
  void connect() {
    print('Connected to database');
  }
}

void main() {
  var db1 = DatabaseConnection();
  var db2 = DatabaseConnection();
  
  print(identical(db1, db2)); // true - same instance
}''',
          'Singleton ensures only one instance of a class exists throughout the application.',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Factory Pattern - Object Creation',
          '''abstract class Vehicle {
  void start();
}

class Car implements Vehicle {
  @override
  void start() => print('Car engine started');
}

class Motorcycle implements Vehicle {
  @override
  void start() => print('Motorcycle engine started');
}

class VehicleFactory {
  static Vehicle createVehicle(String type) {
    switch (type.toLowerCase()) {
      case 'car':
        return Car();
      case 'motorcycle':
        return Motorcycle();
      default:
        throw ArgumentError('Unknown vehicle type');
    }
  }
}

void main() {
  Vehicle car = VehicleFactory.createVehicle('car');
  Vehicle bike = VehicleFactory.createVehicle('motorcycle');
  
  car.start();    // Car engine started
  bike.start();   // Motorcycle engine started
}''',
          'Factory pattern creates objects without specifying their exact classes.',
        ),
        const SizedBox(height: 16),
        _buildKeyPoints([
          'Singleton: Ensures single instance (database connections, loggers)',
          'Factory: Creates objects based on input parameters',
          'Observer: Notifies multiple objects about state changes',
          'Strategy: Enables switching between different algorithms',
        ]),
      ],
    );
  }

  Widget _buildGettersSettersContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Getters and Setters',
          'Special methods that provide controlled access to class properties, enabling validation and computed properties.',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Property Access Control',
          '''class Temperature {
  double _celsius = 0.0;
  
  // Getter for celsius
  double get celsius => _celsius;
  
  // Setter for celsius with validation
  set celsius(double value) {
    if (value < -273.15) {
      throw ArgumentError('Temperature cannot be below absolute zero');
    }
    _celsius = value;
  }
  
  // Computed property - Fahrenheit
  double get fahrenheit => (_celsius * 9/5) + 32;
  
  set fahrenheit(double value) {
    _celsius = (value - 32) * 5/9;
  }
  
  // Read-only property
  String get description {
    if (_celsius < 0) return 'Freezing';
    if (_celsius < 20) return 'Cold';
    if (_celsius < 30) return 'Warm';
    return 'Hot';
  }
}

void main() {
  var temp = Temperature();
  
  temp.celsius = 25;
  print('\${temp.celsius}°C = \${temp.fahrenheit}°F');
  print('Description: \${temp.description}');
  
  temp.fahrenheit = 86;
  print('New celsius: \${temp.celsius}°C');
}''',
          'Getters and setters provide controlled access with validation and computed properties.',
        ),
        const SizedBox(height: 16),
        _buildKeyPoints([
          'Validation: Setters can validate data before assignment',
          'Computed Properties: Getters can calculate values on-the-fly',
          'Encapsulation: Control how properties are accessed and modified',
          'Read-only Properties: Getters without setters create immutable properties',
        ]),
      ],
    );
  }

  Widget _buildAbstractClassesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Abstract Classes',
          'Classes that cannot be instantiated directly and may contain abstract methods that must be implemented by subclasses.',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Abstract Class with Template Method Pattern',
          '''abstract class PaymentProcessor {
  // Template method - defines the algorithm structure
  void processPayment(double amount) {
    if (validatePayment(amount)) {
      executePayment(amount);
      sendConfirmation();
    } else {
      throw Exception('Payment validation failed');
    }
  }
  
  // Abstract methods - must be implemented by subclasses
  bool validatePayment(double amount);
  void executePayment(double amount);
  
  // Concrete method - shared implementation
  void sendConfirmation() {
    print('Payment confirmation sent');
  }
}

class CreditCardProcessor extends PaymentProcessor {
  final String cardNumber;
  
  CreditCardProcessor(this.cardNumber);
  
  @override
  bool validatePayment(double amount) {
    print('Validating credit card: \$cardNumber');
    return cardNumber.length == 16 && amount > 0;
  }
  
  @override
  void executePayment(double amount) {
    print('Processing \\\$\$amount via credit card');
  }
}

class PayPalProcessor extends PaymentProcessor {
  final String email;
  
  PayPalProcessor(this.email);
  
  @override
  bool validatePayment(double amount) {
    print('Validating PayPal account: \$email');
    return email.contains('@') && amount > 0;
  }
  
  @override
  void executePayment(double amount) {
    print('Processing \\\$\$amount via PayPal');
  }
}

void main() {
  PaymentProcessor creditCard = CreditCardProcessor('1234567890123456');
  PaymentProcessor paypal = PayPalProcessor('user@example.com');
  
  creditCard.processPayment(100.0);
  paypal.processPayment(50.0);
}''',
          'Abstract classes define common structure while forcing subclasses to implement specific behavior.',
        ),
        const SizedBox(height: 16),
        _buildKeyPoints([
          'Cannot be instantiated directly - must be extended',
          'Can contain both abstract and concrete methods',
          'Template Method Pattern: Define algorithm structure in base class',
          'Enforces consistent interface across related classes',
        ]),
      ],
    );
  }

  Widget _buildInterfacesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Interfaces (Abstract Classes in Dart)',
          'Dart uses abstract classes to define interfaces - contracts that specify what methods a class must implement.',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Multiple Interface Implementation',
          '''// Interfaces defined as abstract classes
abstract class Flyable {
  void fly();
  double get maxAltitude;
}

abstract class Swimmable {
  void swim();
  double get maxDepth;
}

abstract class Drawable {
  void draw();
}

// Class implementing multiple interfaces
class Duck implements Flyable, Swimmable, Drawable {
  @override
  void fly() => print('Duck is flying');
  
  @override
  double get maxAltitude => 1000.0;
  
  @override
  void swim() => print('Duck is swimming');
  
  @override
  double get maxDepth => 5.0;
  
  @override
  void draw() => print('Drawing a duck 🦆');
}

class Airplane implements Flyable, Drawable {
  @override
  void fly() => print('Airplane is flying');
  
  @override
  double get maxAltitude => 12000.0;
  
  @override
  void draw() => print('Drawing an airplane ✈️');
}

// Using interfaces for polymorphism
void demonstrateFlight(List<Flyable> flyingObjects) {
  for (var obj in flyingObjects) {
    obj.fly();
    print('Max altitude: \${obj.maxAltitude}m');
  }
}

void main() {
  var duck = Duck();
  var plane = Airplane();
  
  demonstrateFlight([duck, plane]);
  
  // Interface segregation - only use what you need
  if (duck is Swimmable) {
    duck.swim();
  }
}''',
          'Interfaces define contracts that classes must follow, enabling multiple inheritance of behavior.',
        ),
        const SizedBox(height: 16),
        _buildKeyPoints([
          'Define contracts without implementation details',
          'Enable multiple inheritance of behavior in Dart',
          'Promote loose coupling between components',
          'Support polymorphism and code reusability',
        ]),
      ],
    );
  }

  Widget _buildDependencyInjectionContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Dependency Injection',
          'A design pattern where dependencies are provided to a class from external sources rather than created internally.',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Constructor and Setter Injection',
          '''// Abstract dependency
abstract class Logger {
  void log(String message);
}

// Concrete implementations
class FileLogger implements Logger {
  @override
  void log(String message) {
    print('FILE: \$message');
  }
}

class ConsoleLogger implements Logger {
  @override
  void log(String message) {
    print('CONSOLE: \$message');
  }
}

// Service class with dependency injection
class UserService {
  final Logger _logger;
  
  // Constructor injection
  UserService(this._logger);
  
  void createUser(String username) {
    // Business logic
    _logger.log('Creating user: \$username');
    
    // Simulate user creation
    _logger.log('User \$username created successfully');
  }
}

// Dependency injection container (simple example)
class DIContainer {
  static final Map<Type, dynamic> _services = {};
  
  static void register<T>(T instance) {
    _services[T] = instance;
  }
  
  static T get<T>() {
    final service = _services[T];
    if (service == null) {
      throw Exception('Service \$T not registered');
    }
    return service as T;
  }
}

void main() {
  // Configure dependencies
  DIContainer.register<Logger>(ConsoleLogger());
  
  // Inject dependencies
  var userService = UserService(DIContainer.get<Logger>());
  userService.createUser('john_doe');
  
  // Easy to switch implementations
  DIContainer.register<Logger>(FileLogger());
  var userService2 = UserService(DIContainer.get<Logger>());
  userService2.createUser('jane_doe');
}''',
          'Dependency injection makes code more testable, flexible, and maintainable.',
        ),
        const SizedBox(height: 16),
        _buildKeyPoints([
          'Loose Coupling: Classes depend on abstractions, not concrete implementations',
          'Testability: Easy to inject mock dependencies for unit testing',
          'Flexibility: Switch implementations without changing client code',
          'Single Responsibility: Classes focus on business logic, not dependency creation',
        ]),
      ],
    );
  }

  Widget _buildCRUDContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'CRUD Operations',
          'Create, Read, Update, Delete - the four basic operations for persistent storage and data management.',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Generic CRUD Repository Pattern',
          '''// Entity model
class User {
  final int? id;
  final String name;
  final String email;
  final DateTime createdAt;
  
  User({
    this.id,
    required this.name,
    required this.email,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
  
  User copyWith({int? id, String? name, String? email}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      createdAt: createdAt,
    );
  }
  
  @override
  String toString() => 'User(id: \$id, name: \$name, email: \$email)';
}

// Generic CRUD interface
abstract class Repository<T> {
  Future<T> create(T item);
  Future<T?> read(int id);
  Future<List<T>> readAll();
  Future<T> update(int id, T item);
  Future<bool> delete(int id);
}

// User repository implementation
class UserRepository implements Repository<User> {
  final Map<int, User> _users = {};
  int _nextId = 1;
  
  @override
  Future<User> create(User user) async {
    final newUser = user.copyWith(id: _nextId++);
    _users[newUser.id!] = newUser;
    print('Created: \$newUser');
    return newUser;
  }
  
  @override
  Future<User?> read(int id) async {
    final user = _users[id];
    print('Read: \$user');
    return user;
  }
  
  @override
  Future<List<User>> readAll() async {
    final users = _users.values.toList();
    print('Read all: \${users.length} users');
    return users;
  }
  
  @override
  Future<User> update(int id, User user) async {
    if (!_users.containsKey(id)) {
      throw Exception('User with id \$id not found');
    }
    final updatedUser = user.copyWith(id: id);
    _users[id] = updatedUser;
    print('Updated: \$updatedUser');
    return updatedUser;
  }
  
  @override
  Future<bool> delete(int id) async {
    final removed = _users.remove(id);
    print('Deleted user with id: \$id');
    return removed != null;
  }
}

void main() async {
  var repo = UserRepository();
  
  // Create
  var user1 = await repo.create(
    User(name: 'John Doe', email: 'john@example.com')
  );
  
  // Read
  var foundUser = await repo.read(1);
  
  // Update
  await repo.update(1, User(name: 'John Updated', email: 'john.updated@example.com'));
  
  // Delete
  await repo.delete(1);
}''',
          'CRUD operations form the foundation of data persistence in most applications.',
        ),
        const SizedBox(height: 16),
        _buildKeyPoints([
          'Create: Add new records to the data store',
          'Read: Retrieve existing records by ID or criteria',
          'Update: Modify existing records with new data',
          'Delete: Remove records from the data store',
          'Repository Pattern: Abstracts data access logic from business logic',
        ]),
      ],
    );
  }
}
