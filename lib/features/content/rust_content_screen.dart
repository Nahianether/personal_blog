import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'base_content_screen.dart';
import '../../shared/widgets/content_index_tab.dart';

class RustContentScreen extends BaseContentScreen {
  const RustContentScreen({super.key});

  @override
  State<RustContentScreen> createState() => _RustContentScreenState();
}

class _RustContentScreenState extends BaseContentScreenState<RustContentScreen> {
  
  // Global keys for navigation
  final GlobalKey _overviewKey = GlobalKey();
  final GlobalKey _fundamentalsKey = GlobalKey();
  final GlobalKey _tupleStructsKey = GlobalKey();
  final GlobalKey _genericsKey = GlobalKey();
  final GlobalKey _errorHandlingKey = GlobalKey();
  final GlobalKey _patternMatchingKey = GlobalKey();
  final GlobalKey _smartPointersKey = GlobalKey();
  final GlobalKey _concurrencyKey = GlobalKey();
  final GlobalKey _ownershipKey = GlobalKey();
  final GlobalKey _macrosKey = GlobalKey();
  final GlobalKey _testingKey = GlobalKey();
  final GlobalKey _specializedKey = GlobalKey();

  @override
  String get screenTitle => 'Rust Programming';

  @override
  String get screenSubtitle => 'Build fast, safe, and concurrent systems programming solutions';

  @override
  IconData get screenIcon => Icons.code;

  @override
  Color get screenColor => const Color(0xFFFF7043);

  @override
  List<IndexItem> get indexItems => [
    IndexItem(
      id: 'overview',
      title: 'Course Overview',
      subtitle: 'Introduction to comprehensive Rust programming',
      icon: Icons.info_outline,
      color: const Color(0xFFFF7043),
      globalKey: _overviewKey,
    ),
    IndexItem(
      id: 'fundamentals',
      title: 'Rust Fundamentals',
      subtitle: 'Basic syntax, types, and core concepts',
      icon: Icons.foundation,
      color: const Color(0xFFFF7043),
      globalKey: _fundamentalsKey,
    ),
    IndexItem(
      id: 'tuple_structs',
      title: 'Tuple Structs',
      subtitle: 'Newtype pattern for type safety',
      icon: Icons.data_object,
      color: const Color(0xFFFF7043),
      globalKey: _tupleStructsKey,
    ),
    IndexItem(
      id: 'generics',
      title: 'Generics & Traits',
      subtitle: 'Flexible and reusable code with generics',
      icon: Icons.schema,
      color: const Color(0xFFFF7043),
      globalKey: _genericsKey,
    ),
    IndexItem(
      id: 'error_handling',
      title: 'Error Handling',
      subtitle: 'Robust error handling with Result and Option',
      icon: Icons.error_outline,
      color: const Color(0xFFFF7043),
      globalKey: _errorHandlingKey,
    ),
    IndexItem(
      id: 'pattern_matching',
      title: 'Pattern Matching',
      subtitle: 'Powerful pattern matching with match expressions',
      icon: Icons.pattern,
      color: const Color(0xFFFF7043),
      globalKey: _patternMatchingKey,
    ),
    IndexItem(
      id: 'smart_pointers',
      title: 'Smart Pointers',
      subtitle: 'Memory management with Box, Rc, and Arc',
      icon: Icons.memory,
      color: const Color(0xFFFF7043),
      globalKey: _smartPointersKey,
    ),
    IndexItem(
      id: 'concurrency',
      title: 'Concurrency & Async',
      subtitle: 'Parallel programming and async/await',
      icon: Icons.sync,
      color: const Color(0xFFFF7043),
      globalKey: _concurrencyKey,
    ),
    IndexItem(
      id: 'ownership',
      title: 'Ownership Deep Dive',
      subtitle: 'Understanding Rust\'s memory management system',
      icon: Icons.security,
      color: const Color(0xFFFF7043),
      globalKey: _ownershipKey,
    ),
    IndexItem(
      id: 'macros',
      title: 'Rust Macros',
      subtitle: 'Code generation with declarative and procedural macros',
      icon: Icons.functions,
      color: const Color(0xFFFF7043),
      globalKey: _macrosKey,
    ),
    IndexItem(
      id: 'testing',
      title: 'Testing & Documentation',
      subtitle: 'Comprehensive testing strategies and documentation',
      icon: Icons.verified,
      color: const Color(0xFFFF7043),
      globalKey: _testingKey,
    ),
    IndexItem(
      id: 'specialized',
      title: 'Specialized Applications',
      subtitle: 'Real-world Rust development scenarios',
      icon: Icons.apps,
      color: const Color(0xFFFF7043),
      globalKey: _specializedKey,
    ),
  ];

  @override
  Widget buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Course Overview
        buildTopicCard(
          'Course Overview',
          'This comprehensive Rust course covers everything from fundamentals to advanced topics. Based on Google\'s Comprehensive Rust curriculum.',
          buildContentSection(
            'Course Overview',
            'This comprehensive Rust course covers everything from fundamentals to advanced topics. Based on Google\'s Comprehensive Rust curriculum.',
            [],
            showBullets: false,
          ),
          key: _overviewKey,
        ),
        
        const SizedBox(height: 24),
        
        // Rust Fundamentals
        buildTopicCard(
          'Rust Fundamentals',
          'Basic syntax, types, and core concepts',
          buildModuleCard(
            'Rust Fundamentals',
            'Basic syntax, types, and core concepts',
            [
              'Variables and mutability',
              'Data types and type system',
              'Functions and control flow',
              'Ownership and borrowing',
              'References and lifetimes',
              'Structs and enums',
            ],
            const Color(0xFFE74C3C),
            Icons.foundation,
          ),
          key: _fundamentalsKey,
        ),
        
        const SizedBox(height: 24),
        
        // Tuple Structs Deep Dive
        buildTopicCard(
          'Tuple Structs',
          'Learn about tuple structs and the newtype pattern for type safety',
          _buildTupleStructsContent(),
          key: _tupleStructsKey,
        ),
        
        const SizedBox(height: 24),
        
        // Generics and Traits
        buildTopicCard(
          'Generics and Trait System',
          'Write flexible and reusable code with Rust generics and traits',
          _buildGenericsContent(),
          key: _genericsKey,
        ),
        
        const SizedBox(height: 24),
        
        // Error Handling
        buildTopicCard(
          'Error Handling',
          'Robust error handling with Result<T, E> and Option<T>',
          _buildErrorHandlingContent(),
          key: _errorHandlingKey,
        ),
        
        const SizedBox(height: 24),
        
        // Pattern Matching
        buildTopicCard(
          'Pattern Matching',
          'Powerful pattern matching with match expressions',
          _buildPatternMatchingContent(),
          key: _patternMatchingKey,
        ),
        
        const SizedBox(height: 24),
        
        // Smart Pointers
        buildTopicCard(
          'Smart Pointers',
          'Memory management with Box, Rc, and Arc',
          _buildSmartPointersContent(),
          key: _smartPointersKey,
        ),
        
        const SizedBox(height: 24),
        
        // Concurrency
        buildTopicCard(
          'Concurrency and Async',
          'Parallel programming and async/await in Rust',
          _buildConcurrencyContent(),
          key: _concurrencyKey,
        ),
        
        const SizedBox(height: 24),
        
        // Ownership Deep Dive
        buildTopicCard(
          'Ownership Deep Dive',
          'Understanding Rust\'s unique memory management system',
          _buildOwnershipContent(),
          key: _ownershipKey,
        ),
        
        const SizedBox(height: 24),
        
        // Macros
        buildTopicCard(
          'Rust Macros',
          'Code generation with declarative and procedural macros',
          _buildMacrosContent(),
          key: _macrosKey,
        ),
        
        const SizedBox(height: 24),
        
        // Testing and Documentation
        buildTopicCard(
          'Testing & Documentation',
          'Comprehensive testing strategies and documentation practices',
          _buildTestingContent(),
          key: _testingKey,
        ),
        
        const SizedBox(height: 24),
        
        // Specialized Applications
        buildTopicCard(
          'Specialized Applications',
          'Real-world Rust development scenarios',
          _buildSpecializedContent(),
          key: _specializedKey,
        ),
      ],
    );
  }


  Widget _buildTupleStructsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Definition',
          'A tuple struct is a struct where field names are unimportant. They are useful for creating type-safe wrappers around primitive types.',
        ),
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Basic Syntax',
          '''struct Point(i32, i32);

fn main() {
    let p = Point(17, 23);
    println!("({}, {})", p.0, p.1);
}''',
          'Access fields using dot notation with indices (p.0, p.1)',
        ),
        
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Newtype Pattern',
          '''struct PoundsOfForce(f64);
struct Newtons(f64);

fn compute_thruster_force() -> PoundsOfForce {
    todo!("Ask a rocket scientist at NASA")
}

fn compute_weight(mass: f64) -> Newtons {
    Newtons(mass * 9.81)
}''',
          'Use tuple structs to encode additional information about primitive types for type safety.',
        ),
        
        const SizedBox(height: 16),
        
        _buildKeyPoints([
          'Provides type safety for similar data types',
          'Prevents mixing up values with same underlying type',
          'Zero runtime cost - same as underlying type',
          'Useful for measurements, IDs, and validated values',
        ]),
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
          color: screenColor.withValues(alpha: 0.3),
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
              color: screenColor,
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
                decoration: BoxDecoration(
                  color: screenColor,
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

  Widget _buildGenericsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Generics and Traits',
          'Generics allow you to write flexible code that works with different types, while traits define shared behavior.',
        ),
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Generic Functions and Structs',
          '''// Generic function
fn largest<T: PartialOrd>(list: &[T]) -> &T {
    let mut largest = &list[0];
    for item in list {
        if item > largest {
            largest = item;
        }
    }
    largest
}

// Generic struct
struct Point<T> {
    x: T,
    y: T,
}

impl<T> Point<T> {
    fn new(x: T, y: T) -> Self {
        Point { x, y }
    }
}

// Trait definition
trait Summary {
    fn summarize(&self) -> String;
    
    // Default implementation
    fn summarize_author(&self) -> String {
        format!("(Read more from {}...)", self.summarize())
    }
}

// Implementing trait
struct Article {
    headline: String,
    content: String,
}

impl Summary for Article {
    fn summarize(&self) -> String {
        format!("{}: {}", self.headline, self.content)
    }
}''',
          'Generics enable type flexibility while traits provide shared behavior.',
        ),
        
        const SizedBox(height: 16),
        
        _buildKeyPoints([
          'Generics eliminate code duplication across types',
          'Traits define shared behavior that types can implement',
          'Trait bounds constrain generic types to specific capabilities',
          'Default trait implementations provide fallback behavior',
          'Zero-cost abstractions - no runtime performance overhead',
        ]),
      ],
    );
  }

  Widget _buildErrorHandlingContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Rust Error Handling',
          'Rust uses Result<T, E> for recoverable errors and Option<T> for nullable values, eliminating null pointer exceptions.',
        ),
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Result and Option Types',
          '''use std::fs::File;
use std::io::ErrorKind;

// Function returning Result
fn read_username_from_file() -> Result<String, io::Error> {
    let username_file_result = File::open("hello.txt");

    let mut username_file = match username_file_result {
        Ok(file) => file,
        Err(e) => return Err(e),
    };

    let mut username = String::new();

    match username_file.read_to_string(&mut username) {
        Ok(_) => Ok(username),
        Err(e) => Err(e),
    }
}

// Using ? operator for cleaner error propagation
fn read_username_from_file_short() -> Result<String, io::Error> {
    let mut username = String::new();
    File::open("hello.txt")?.read_to_string(&mut username)?;
    Ok(username)
}

// Pattern matching with Result
fn main() {
    let result = File::open("hello.txt");
    
    match result {
        Ok(file) => println!("File opened successfully"),
        Err(error) => match error.kind() {
            ErrorKind::NotFound => println!("File not found"),
            ErrorKind::PermissionDenied => println!("Permission denied"),
            other_error => println!("Problem opening file: {:?}", other_error),
        },
    }
}''',
          'Comprehensive error handling with Result, Option, and the ? operator.',
        ),
      ],
    );
  }

  Widget _buildPatternMatchingContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Pattern Matching',
          'Rust pattern matching allows you to match against the structure of types and extract values.',
        ),
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Advanced Pattern Matching',
          '''enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(i32, i32, i32),
}

fn process_message(msg: Message) {
    match msg {
        Message::Quit => {
            println!("The Quit variant has no data to destructure.");
        }
        Message::Move { x, y } => {
            println!("Move in the x direction {} and in the y direction {}", x, y);
        }
        Message::Write(text) => println!("Text message: {}", text),
        Message::ChangeColor(r, g, b) => {
            println!("Change the color to red {}, green {}, and blue {}", r, g, b);
        }
    }
}

// Pattern matching with guards
fn check_number(x: Option<i32>) {
    match x {
        Some(n) if n < 5 => println!("less than five: {}", n),
        Some(n) => println!("{}", n),
        None => (),
    }
}

// Destructuring structs
struct Point {
    x: i32,
    y: i32,
}

fn analyze_point(point: Point) {
    match point {
        Point { x, y: 0 } => println!("On the x axis at {}", x),
        Point { x: 0, y } => println!("On the y axis at {}", y),
        Point { x, y } => println!("On neither axis: ({}, {})", x, y),
    }
}''',
          'Pattern matching with enums, structs, guards, and destructuring.',
        ),
      ],
    );
  }

  Widget _buildSmartPointersContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Smart Pointers',
          'Smart pointers provide additional metadata and capabilities beyond regular references.',
        ),
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Box, Rc, and Arc',
          '''use std::rc::Rc;
use std::sync::Arc;
use std::thread;

// Box<T> - heap allocation
fn use_box() {
    let b = Box::new(5);
    println!("b = {}", b);
} // b is deallocated here

// Rc<T> - reference counting for single-threaded scenarios
#[derive(Debug)]
struct Node {
    value: i32,
    children: Vec<Rc<Node>>,
}

fn use_rc() {
    let leaf = Rc::new(Node {
        value: 3,
        children: vec![],
    });

    let branch = Rc::new(Node {
        value: 5,
        children: vec![Rc::clone(&leaf)],
    });

    println!("leaf strong count: {}", Rc::strong_count(&leaf));
}

// Arc<T> - atomic reference counting for multi-threaded scenarios
fn use_arc() {
    let data = Arc::new(vec![1, 2, 3, 4, 5]);

    let mut handles = vec![];

    for i in 0..3 {
        let data = Arc::clone(&data);
        let handle = thread::spawn(move || {
            println!("Thread {}: {:?}", i, data);
        });
        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }
}''',
          'Different smart pointer types for various memory management needs.',
        ),
      ],
    );
  }

  Widget _buildConcurrencyContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Rust Concurrency',
          'Rust provides fearless concurrency through ownership, threads, and async programming.',
        ),
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Threads and Async Programming',
          '''use std::thread;
use std::sync::{Arc, Mutex};
use std::time::Duration;

// Basic threading
fn basic_threading() {
    let handle = thread::spawn(|| {
        for i in 1..10 {
            println!("hi number {} from the spawned thread!", i);
            thread::sleep(Duration::from_millis(1));
        }
    });

    handle.join().unwrap();
}

// Shared state with Mutex
fn shared_state() {
    let counter = Arc::new(Mutex::new(0));
    let mut handles = vec![];

    for _ in 0..10 {
        let counter = Arc::clone(&counter);
        let handle = thread::spawn(move || {
            let mut num = counter.lock().unwrap();
            *num += 1;
        });
        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }

    println!("Result: {}", *counter.lock().unwrap());
}

// Channels for communication
use std::sync::mpsc;

fn use_channels() {
    let (tx, rx) = mpsc::channel();

    thread::spawn(move || {
        let vals = vec!["hi", "from", "the", "thread"];
        for val in vals {
            tx.send(val).unwrap();
            thread::sleep(Duration::from_secs(1));
        }
    });

    for received in rx {
        println!("Got: {}", received);
    }
}''',
          'Threading, mutexes, and channels for safe concurrency.',
        ),
      ],
    );
  }

  Widget _buildSpecializedContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Specialized Rust Applications',
          'Rust excels in various domains from systems programming to web development.',
        ),
        const SizedBox(height: 20),
        
        _buildSpecializedApp('Systems Programming', 
          'Operating systems, drivers, embedded systems', 
          'Zero-cost abstractions with memory safety'),
        
        const SizedBox(height: 12),
        
        _buildSpecializedApp('Web Development', 
          'Web servers, APIs with frameworks like Actix, Rocket', 
          'High performance with excellent safety guarantees'),
        
        const SizedBox(height: 12),
        
        _buildSpecializedApp('WebAssembly', 
          'High-performance web applications', 
          'Near-native performance in the browser'),
        
        const SizedBox(height: 12),
        
        _buildSpecializedApp('Game Development', 
          'Game engines and performance-critical games', 
          'Memory safety without garbage collection overhead'),
        
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Simple Web Server Example',
          '''// Using Actix-web framework
use actix_web::{web, App, HttpResponse, HttpServer, Result};
use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize)]
struct User {
    id: u32,
    name: String,
    email: String,
}

async fn get_user(path: web::Path<u32>) -> Result<HttpResponse> {
    let user_id = path.into_inner();
    
    let user = User {
        id: user_id,
        name: "John Doe".to_string(),
        email: "john@example.com".to_string(),
    };

    Ok(HttpResponse::Ok().json(user))
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .route("/users/{id}", web::get().to(get_user))
    })
    .bind("127.0.0.1:8080")?
    .run()
    .await
}''',
          'Building a RESTful API server with Actix-web framework.',
        ),
      ],
    );
  }

  Widget _buildSpecializedApp(String domain, String description, String advantage) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF34495E),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: screenColor.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            domain,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: screenColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '⚡ $advantage',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: Colors.white60,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOwnershipContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Ownership Rules',
          'Rust\'s ownership system enables memory safety without garbage collection through three fundamental rules.',
        ),
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Move Semantics and Borrowing',
          '''fn main() {
    // Ownership and Move
    let s1 = String::from("hello");
    let s2 = s1; // s1 is moved to s2, s1 is no longer valid
    // println!("{}", s1); // Error! s1 was moved
    println!("{}", s2); // OK
    
    // Borrowing (Immutable Reference)
    let s3 = String::from("world");
    let len = calculate_length(&s3); // Borrowing s3
    println!("Length of '{}' is {}", s3, len); // s3 still valid
    
    // Mutable Borrowing
    let mut s4 = String::from("hello");
    change(&mut s4);
    println!("{}", s4); // Prints "hello, world"
}

fn calculate_length(s: &String) -> usize {
    s.len()
} // s goes out of scope, but doesn't drop the value (it's borrowed)

fn change(s: &mut String) {
    s.push_str(", world");
}''',
          'Ownership moves transfer ownership, while borrowing allows temporary access.',
        ),
        
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Lifetimes and References',
          '''// Lifetime annotations ensure references are valid
fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() > y.len() {
        x
    } else {
        y
    }
}

// Struct with lifetime
struct ImportantExcerpt<'a> {
    part: &'a str,
}

impl<'a> ImportantExcerpt<'a> {
    fn level(&self) -> i32 {
        3
    }
    
    fn announce_and_return_part(&self, announcement: &str) -> &str {
        println!("Attention please: {}", announcement);
        self.part
    }
}

fn main() {
    let string1 = String::from("abcd");
    let string2 = "xyz";
    
    let result = longest(string1.as_str(), string2);
    println!("The longest string is {}", result);
    
    let novel = String::from("Call me Ishmael. Some years ago...");
    let first_sentence = novel.split('.').next().expect("Could not find a '.'");
    let excerpt = ImportantExcerpt { part: first_sentence };
}''',
          'Lifetimes ensure that references are valid for as long as needed.',
        ),
        
        const SizedBox(height: 16),
        
        _buildKeyPoints([
          'Each value has exactly one owner at any time',
          'When owner goes out of scope, value is dropped',
          'References allow borrowing without taking ownership',
          'Mutable references are exclusive (only one at a time)',
          'Lifetimes prevent dangling references at compile time',
        ]),
      ],
    );
  }

  Widget _buildMacrosContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Rust Macros',
          'Macros enable metaprogramming by generating code at compile time, reducing boilerplate and enabling powerful abstractions.',
        ),
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Declarative Macros (macro_rules!)',
          '''// Simple macro
macro_rules! say_hello {
    () => {
        println!("Hello, world!");
    };
}

// Macro with parameters
macro_rules! create_function {
    (\$func_name:ident) => {
        fn \$func_name() {
            println!("You called {:?}()", stringify!(\$func_name));
        }
    };
}

// Vec-like macro
macro_rules! vec_of_strings {
    (\$(\$x:expr),*) => {
        {
            let mut temp_vec = Vec::new();
            \$(
                temp_vec.push(\$x.to_string());
            )*
            temp_vec
        }
    };
}

fn main() {
    say_hello!();
    
    create_function!(foo);
    create_function!(bar);
    
    foo();
    bar();
    
    let my_vec = vec_of_strings!["hello", "world", "rust"];
    println!("{:?}", my_vec);
}''',
          'Declarative macros use pattern matching to generate code.',
        ),
        
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Procedural Macros',
          '''// Derive macro example (in a separate crate)
use proc_macro::TokenStream;
use quote::quote;
use syn;

#[proc_macro_derive(HelloMacro)]
pub fn hello_macro_derive(input: TokenStream) -> TokenStream {
    let ast = syn::parse(input).unwrap();
    impl_hello_macro(&ast)
}

fn impl_hello_macro(ast: &syn::DeriveInput) -> TokenStream {
    let name = &ast.ident;
    let gen = quote! {
        impl HelloMacro for #name {
            fn hello_macro() {
                println!("Hello, Macro! My name is {}!", stringify!(#name));
            }
        }
    };
    gen.into()
}

// Usage:
trait HelloMacro {
    fn hello_macro();
}

#[derive(HelloMacro)]
struct Pancakes;

fn main() {
    Pancakes::hello_macro(); // Prints: Hello, Macro! My name is Pancakes!
}''',
          'Procedural macros operate on token streams for advanced code generation.',
        ),
        
        const SizedBox(height: 16),
        
        _buildKeyPoints([
          'Declarative macros: Pattern-based code generation',
          'Procedural macros: Custom derive, attribute, and function-like macros',
          'Compile-time code generation reduces runtime overhead',
          'Macros can generate complex boilerplate code automatically',
          'Used extensively in popular crates like serde, tokio',
        ]),
      ],
    );
  }

  Widget _buildTestingContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Rust Testing',
          'Rust provides built-in testing framework with unit tests, integration tests, and documentation tests.',
        ),
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Unit and Integration Testing',
          '''// src/lib.rs
pub fn add(a: i32, b: i32) -> i32 {
    a + b
}

pub fn divide(a: f64, b: f64) -> Result<f64, String> {
    if b == 0.0 {
        Err("Cannot divide by zero".to_string())
    } else {
        Ok(a / b)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_add() {
        assert_eq!(add(2, 3), 5);
    }

    #[test]
    fn test_add_negative() {
        assert_eq!(add(-2, 3), 1);
    }

    #[test]
    fn test_divide_success() {
        assert_eq!(divide(10.0, 2.0), Ok(5.0));
    }

    #[test]
    fn test_divide_by_zero() {
        assert_eq!(divide(10.0, 0.0), Err("Cannot divide by zero".to_string()));
    }

    #[test]
    #[should_panic(expected = "assertion failed")]
    fn test_panic() {
        assert_eq!(2 + 2, 5);
    }

    #[test]
    #[ignore]
    fn expensive_test() {
        // This test is ignored by default
        // Run with: cargo test -- --ignored
    }
}

// Integration test (tests/integration_test.rs)
use my_crate::add;

#[test]
fn test_add_integration() {
    assert_eq!(add(2, 3), 5);
}''',
          'Comprehensive testing with unit tests and integration tests.',
        ),
        
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Property-Based Testing with Proptest',
          '''use proptest::prelude::*;

fn reverse_string(s: &str) -> String {
    s.chars().rev().collect()
}

proptest! {
    #[test]
    fn test_reverse_twice_is_identity(s in ".*") {
        let reversed_twice = reverse_string(&reverse_string(&s));
        prop_assert_eq!(s, reversed_twice);
    }
    
    #[test]
    fn test_reverse_length_preserved(s in ".*") {
        let reversed = reverse_string(&s);
        prop_assert_eq!(s.len(), reversed.len());
    }
    
    #[test]
    fn test_add_commutative(a in any::<i32>(), b in any::<i32>()) {
        // Assuming we don't overflow
        if let (Some(sum1), Some(sum2)) = (a.checked_add(b), b.checked_add(a)) {
            prop_assert_eq!(sum1, sum2);
        }
    }
}''',
          'Property-based testing verifies properties that should hold for all inputs.',
        ),
        
        const SizedBox(height: 16),
        
        _buildKeyPoints([
          'Built-in test framework with cargo test command',
          'Unit tests in same file, integration tests in separate directory',
          'Documentation tests ensure examples in docs work',
          'Property-based testing with crates like proptest',
          'Benchmark testing with criterion crate for performance',
        ]),
      ],
    );
  }
}