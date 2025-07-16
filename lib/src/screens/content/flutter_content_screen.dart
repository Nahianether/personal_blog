import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'base_content_screen.dart';
import '../../widgets/content_index_tab.dart';

class FlutterContentScreen extends BaseContentScreen {
  const FlutterContentScreen({super.key});

  @override
  State<FlutterContentScreen> createState() => _FlutterContentScreenState();
}

class _FlutterContentScreenState extends BaseContentScreenState<FlutterContentScreen> {
  
  // Global keys for navigation
  final GlobalKey _androidLifecycleKey = GlobalKey();
  final GlobalKey _widgetTreeKey = GlobalKey();
  final GlobalKey _streamsKey = GlobalKey();
  final GlobalKey _isolatesKey = GlobalKey();
  final GlobalKey _riverpodKey = GlobalKey();
  final GlobalKey _providerVsRiverpodKey = GlobalKey();
  final GlobalKey _methodChannelKey = GlobalKey();
  final GlobalKey _navigationKey = GlobalKey();
  final GlobalKey _customAnimationsKey = GlobalKey();
  final GlobalKey _firebaseKey = GlobalKey();
  final GlobalKey _googleMapsKey = GlobalKey();
  final GlobalKey _databaseKey = GlobalKey();
  final GlobalKey _testingKey = GlobalKey();
  final GlobalKey _performanceKey = GlobalKey();
  final GlobalKey _developmentToolsKey = GlobalKey();

  @override
  String get screenTitle => 'Flutter Development';

  @override
  String get screenSubtitle => 'Build beautiful, fast, and cross-platform mobile applications';

  @override
  IconData get screenIcon => Icons.phone_android;

  @override
  Color get screenColor => const Color(0xFFE91E63);

  @override
  List<IndexItem> get indexItems => [
    IndexItem(
      id: 'android_lifecycle',
      title: 'Android Lifecycle',
      subtitle: 'Understanding the Android activity lifecycle methods',
      icon: Icons.refresh,
      color: const Color(0xFFE91E63),
      globalKey: _androidLifecycleKey,
    ),
    IndexItem(
      id: 'widget_tree',
      title: 'Flutter Widget Tree',
      subtitle: 'How Flutter builds and manages widget hierarchies',
      icon: Icons.account_tree,
      color: const Color(0xFFE91E63),
      globalKey: _widgetTreeKey,
    ),
    IndexItem(
      id: 'streams',
      title: 'Streams',
      subtitle: 'Asynchronous data handling with Dart streams',
      icon: Icons.stream,
      color: const Color(0xFFE91E63),
      globalKey: _streamsKey,
    ),
    IndexItem(
      id: 'isolates',
      title: 'Isolates',
      subtitle: 'Concurrent programming and heavy computation',
      icon: Icons.memory,
      color: const Color(0xFFE91E63),
      globalKey: _isolatesKey,
    ),
    IndexItem(
      id: 'riverpod',
      title: 'Riverpod State Management',
      subtitle: 'Modern state management with Riverpod providers',
      icon: Icons.settings_input_component,
      color: const Color(0xFFE91E63),
      globalKey: _riverpodKey,
    ),
    IndexItem(
      id: 'provider_vs_riverpod',
      title: 'Provider vs Riverpod',
      subtitle: 'Comparing different state management approaches',
      icon: Icons.compare_arrows,
      color: const Color(0xFFE91E63),
      globalKey: _providerVsRiverpodKey,
    ),
    IndexItem(
      id: 'method_channel',
      title: 'Method Channel',
      subtitle: 'Platform-specific code integration',
      icon: Icons.link,
      color: const Color(0xFFE91E63),
      globalKey: _methodChannelKey,
    ),
    IndexItem(
      id: 'navigation',
      title: 'Navigation (Go Router)',
      subtitle: 'Modern navigation with URL-based routing',
      icon: Icons.navigation,
      color: const Color(0xFFE91E63),
      globalKey: _navigationKey,
    ),
    IndexItem(
      id: 'custom_animations',
      title: 'Custom Animations',
      subtitle: 'Building beautiful animations with Flutter framework',
      icon: Icons.animation,
      color: const Color(0xFFE91E63),
      globalKey: _customAnimationsKey,
    ),
    IndexItem(
      id: 'firebase',
      title: 'Firebase Integration',
      subtitle: 'Backend services with Firebase Cloud Messaging',
      icon: Icons.cloud,
      color: const Color(0xFFE91E63),
      globalKey: _firebaseKey,
    ),
    IndexItem(
      id: 'google_maps',
      title: 'Google Maps Integration',
      subtitle: 'Location services and interactive maps',
      icon: Icons.map,
      color: const Color(0xFFE91E63),
      globalKey: _googleMapsKey,
    ),
    IndexItem(
      id: 'database',
      title: 'Database Solutions',
      subtitle: 'Local storage with Hive, Isar, and SQLite',
      icon: Icons.storage,
      color: const Color(0xFFE91E63),
      globalKey: _databaseKey,
    ),
    IndexItem(
      id: 'testing',
      title: 'Testing in Flutter',
      subtitle: 'Unit, widget, and integration testing approaches',
      icon: Icons.bug_report,
      color: const Color(0xFFE91E63),
      globalKey: _testingKey,
    ),
    IndexItem(
      id: 'performance',
      title: 'Performance Optimization',
      subtitle: 'Building fast and efficient Flutter applications',
      icon: Icons.speed,
      color: const Color(0xFFE91E63),
      globalKey: _performanceKey,
    ),
    IndexItem(
      id: 'development_tools',
      title: 'Development Tools & Tips',
      subtitle: 'Hot reload, SafeArea, and development best practices',
      icon: Icons.build,
      color: const Color(0xFFE91E63),
      globalKey: _developmentToolsKey,
    ),
  ];

  @override
  Widget buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Course Overview
        buildContentSection(
          'Course Overview',
          'Master Flutter development with comprehensive coverage of mobile app development, from basics to advanced topics.',
          [],
          showBullets: false,
        ),

        const SizedBox(height: 32),

        // Android Lifecycle
        buildTopicCard(
          'Android Lifecycle',
          'Understanding the Android activity lifecycle',
          _buildAndroidLifecycleContent(),
          key: _androidLifecycleKey,
        ),

        const SizedBox(height: 24),

        // Flutter Widget Tree
        buildTopicCard(
          'Flutter Widget Tree',
          'Understanding how Flutter builds and manages widget trees',
          _buildWidgetTreeContent(),
          key: _widgetTreeKey,
        ),

        const SizedBox(height: 24),

        // Streams
        buildTopicCard(
          'Streams',
          'Asynchronous data handling with Dart streams',
          _buildStreamsContent(),
          key: _streamsKey,
        ),

        const SizedBox(height: 24),

        // Isolates
        buildTopicCard(
          'Isolates',
          'Concurrent programming and heavy computation',
          _buildIsolatesContent(),
          key: _isolatesKey,
        ),

        const SizedBox(height: 24),

        // Riverpod
        buildTopicCard(
          'Riverpod State Management',
          'Modern state management with Riverpod',
          _buildRiverpodContent(),
          key: _riverpodKey,
        ),

        const SizedBox(height: 24),

        // Provider vs Riverpod
        buildTopicCard(
          'Provider vs Riverpod',
          'Comparing different state management approaches',
          _buildProviderVsRiverpodContent(),
          key: _providerVsRiverpodKey,
        ),

        const SizedBox(height: 24),

        // Method Channel
        buildTopicCard(
          'Method Channel',
          'Platform-specific code integration',
          _buildMethodChannelContent(),
          key: _methodChannelKey,
        ),

        const SizedBox(height: 24),

        // Navigation
        buildTopicCard(
          'Navigation (Go Router)',
          'Modern navigation with URL-based routing',
          _buildNavigationContent(),
          key: _navigationKey,
        ),

        const SizedBox(height: 24),

        // Custom Animations
        buildTopicCard(
          'Custom Animations',
          'Building beautiful animations with Flutter animation framework',
          _buildCustomAnimationsContent(),
          key: _customAnimationsKey,
        ),

        const SizedBox(height: 24),

        // Firebase Integration
        buildTopicCard(
          'Firebase Integration',
          'Backend services with Firebase Cloud Messaging',
          _buildFirebaseContent(),
          key: _firebaseKey,
        ),

        const SizedBox(height: 24),

        // Google Maps
        buildTopicCard(
          'Google Maps Integration',
          'Location services and interactive maps',
          _buildGoogleMapsContent(),
          key: _googleMapsKey,
        ),

        const SizedBox(height: 24),

        // Database Solutions
        buildTopicCard(
          'Database Solutions',
          'Local storage with Hive, Isar, and SQLite',
          _buildDatabaseContent(),
          key: _databaseKey,
        ),

        const SizedBox(height: 24),

        // Testing Strategies
        buildTopicCard(
          'Testing in Flutter',
          'Unit, widget, and integration testing approaches',
          _buildTestingContent(),
          key: _testingKey,
        ),

        const SizedBox(height: 24),

        // Performance & Optimization
        buildTopicCard(
          'Performance Optimization',
          'Building fast and efficient Flutter applications',
          _buildPerformanceContent(),
          key: _performanceKey,
        ),

        const SizedBox(height: 24),

        // Development Tools
        buildTopicCard(
          'Development Tools & Tips',
          'Hot reload, SafeArea, and development best practices',
          _buildDevelopmentToolsContent(),
          key: _developmentToolsKey,
        ),
      ],
    );
  }

  Widget _buildAndroidLifecycleContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Android Activity Lifecycle',
          'Understanding the lifecycle methods that Android calls when an activity transitions between states.',
        ),
        const SizedBox(height: 20),
        _buildLifecycleMethod('onCreate', 'Called when the activity is first created.'),
        _buildLifecycleMethod('onStart', 'Called when the activity becomes visible to the user.'),
        _buildLifecycleMethod('onResume', 'Called when the activity starts interacting with the user.'),
        _buildLifecycleMethod('onPause', 'Called when activity is not visible to the user.'),
        _buildLifecycleMethod('onStop', 'Called when activity is no longer visible to the user.'),
        _buildLifecycleMethod('onRestart', 'Called after your activity is stopped, before starting.'),
        _buildLifecycleMethod('onDestroy', 'Called before the activity was destroyed.'),
      ],
    );
  }

  Widget _buildWidgetTreeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Widget Tree Structure',
          'Flutter builds UIs using a tree of widgets, where each widget describes what their view should look like.',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Basic Widget Tree',
          '''runApp -> MaterialApp or CupertinoApp -> Scaffold

// Nested Widget Tree
Container(
  child: Row(
    children: [
      Column(
        children: [
          Text('Hello', style: TextStyle(fontSize: 16)),
          Text('World'),
        ],
      ),
    ],
  ),
)''',
          'Widgets are composed in a hierarchical tree structure.',
        ),
        const SizedBox(height: 16),
        _buildKeyPoints([
          'Dynamic widget tree that rebuilds when state changes',
          'Build method called during widget lifecycle',
          'Stateful widgets can trigger rebuilds',
          'Efficient rendering through widget diffing',
        ]),
      ],
    );
  }

  Widget _buildStreamsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Streams',
          'A way to receive asynchronous data events over time. Fundamental for handling sequences of data that arrive at different times.',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Stream Example',
          '''class CounterStream {
  final _controller = StreamController<int>();
  int _counter = 0;

  CounterStream() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      _counter++;
      _controller.sink.add(_counter);
    });
  }

  Stream<int> get stream => _controller.stream;

  void dispose() {
    _controller.close();
  }
}

// Usage with StreamBuilder
StreamBuilder<int>(
  stream: _counterStream.stream,
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Text('Count: \${snapshot.data}');
    }
    return CircularProgressIndicator();
  },
)''',
          'Streams provide continuous flow of asynchronous data events.',
        ),
      ],
    );
  }

  Widget _buildIsolatesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Isolates',
          'Dart isolates provide true parallelism for CPU-intensive tasks without blocking the main UI thread.',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Compute Function (Simple Tasks)',
          '''int expensiveCalculation(int value) {
  int result = 0;
  for (int i = 0; i < value; i++) {
    result += i;
  }
  return result;
}

void main() async {
  int result = await compute(expensiveCalculation, 1000000);
  print(result); // Output: 499999500000
}''',
          'Use compute() for simple CPU-intensive tasks.',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Isolate.spawn (Heavy Tasks)',
          '''void heavyComputation(SendPort sendPort) {
  int result = 0;
  for (int i = 0; i < 1000000; i++) {
    result += i;
  }
  sendPort.send(result);
}

void main() async {
  final receivePort = ReceivePort();
  await Isolate.spawn(heavyComputation, receivePort.sendPort);

  receivePort.listen((message) {
    print('Result: \$message');
  });
}''',
          'Use Isolate.spawn for more complex background processing.',
        ),
      ],
    );
  }

  Widget _buildRiverpodContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Riverpod Providers',
          'Riverpod offers different types of providers for various state management scenarios.',
        ),
        const SizedBox(height: 20),
        _buildProviderType('Provider', 'Read-only values that don\'t change',
            'final helloWorldProvider = Provider<String>((ref) => \'Hello World\');'),
        _buildProviderType(
            'StateProvider', 'Simple mutable state', 'final counterProvider = StateProvider<int>((ref) => 0);'),
        _buildProviderType('FutureProvider', 'Asynchronous operations',
            'final userProvider = FutureProvider<User>((ref) async => fetchUser());'),
        _buildProviderType('StreamProvider', 'Continuous data flow',
            'final tickerProvider = StreamProvider<int>((ref) => Stream.periodic(...));'),
        _buildProviderType('StateNotifierProvider', 'Complex state logic',
            'final counterProvider = StateNotifierProvider<Counter, int>((ref) => Counter());'),
      ],
    );
  }

  Widget _buildProviderVsRiverpodContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildComparisonSection('API Design', 'Provider: Based on InheritedWidget, requires more boilerplate',
            'Riverpod: More flexible API with compile-time safety'),
        _buildComparisonSection('State Management', 'Provider: Uses ChangeNotifier for mutable state',
            'Riverpod: Encourages immutable state with StateNotifier'),
        _buildComparisonSection(
            'Testing', 'Provider: Complex widget trees for testing', 'Riverpod: Easy mocking and provider overriding'),
        _buildComparisonSection('Performance', 'Provider: Can lead to unnecessary rebuilds',
            'Riverpod: Optimized to avoid unnecessary rebuilds'),
      ],
    );
  }

  Widget _buildMethodChannelContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Method Channel',
          'Bridge for communication between Flutter and platform-specific code (Android/iOS).',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Flutter Side',
          '''class ReverseStringScreen extends StatefulWidget {
  static const platform = MethodChannel('com.example/reverse');
  String _reversedString = 'Reversed string will appear here.';

  Future<void> _getReversedString(String input) async {
    try {
      final String result = await platform.invokeMethod(
        'reverseString', 
        {'input': input}
      );
      setState(() {
        _reversedString = 'Reversed: \$result';
      });
    } on PlatformException catch (e) {
      // Handle error
    }
  }
}''',
          'Define method channel and invoke platform methods.',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Android Side (Kotlin)',
          '''class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example/reverse"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method == "reverseString") {
                    val input = call.argument<String>("input")
                    result.success(reverseString(input))
                } else {
                    result.notImplemented()
                }
            }
    }

    private fun reverseString(input: String): String {
        return input.reversed()
    }
}''',
          'Handle method calls on the native platform side.',
        ),
      ],
    );
  }

  Widget _buildNavigationContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Go Router (Navigator 2.0)',
          'Declarative routing solution with URL-based navigation, ideal for web apps and deep linking.',
        ),
        const SizedBox(height: 20),
        _buildKeyPoints([
          'Declarative routing aligned with Flutter\'s reactive model',
          'URL-based routing perfect for web applications',
          'Native support for deep linking',
          'Simplified nested navigation',
          'Dynamic parameters and query parameters',
          'Browser back/forward button support',
          'State restoration capabilities',
        ]),
        const SizedBox(height: 16),
        _buildCodeExample(
          'Go Router Setup',
          '''final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/details/:id',
      builder: (context, state) => DetailsScreen(
        id: state.params['id']!,
      ),
    ),
  ],
);

// Navigation
context.go('/details/123');
context.push('/settings');''',
          'Declarative route definition and programmatic navigation.',
        ),
      ],
    );
  }

  Widget _buildCustomAnimationsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Flutter Animation Framework',
          'Flutter provides a rich animation framework with AnimationController, Tween, and various animation widgets.',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'AnimationController & Tween',
          '''class AnimatedBox extends StatefulWidget {
  @override
  _AnimatedBoxState createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));
    
    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width: 100,
            height: 100,
            color: _colorAnimation.value,
          ),
        );
      },
    );
  }
}''',
          'Combining scale and color animations with custom curves.',
        ),
        const SizedBox(height: 16),
        _buildKeyPoints([
          'AnimationController manages animation timing and state',
          'Tween defines value ranges for animations',
          'CurvedAnimation adds easing effects',
          'AnimatedBuilder rebuilds widgets during animation',
          'Transform widgets handle geometric transformations',
        ]),
      ],
    );
  }

  Widget _buildFirebaseContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Firebase Cloud Messaging (FCM)',
          'FCM enables you to send push notifications to your Flutter app users across platforms.',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'FCM Setup and Message Handling',
          '''// Add dependencies to pubspec.yaml
// firebase_core: ^2.24.2
// firebase_messaging: ^14.7.10

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

class FCMService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<void> initialize() async {
    await Firebase.initializeApp();
    
    // Request permission for notifications
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    }

    // Get FCM token
    String? token = await messaging.getToken();
    print('FCM Token: \$token');

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received message: \${message.notification?.title}');
      _showNotification(message);
    });

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static void _showNotification(RemoteMessage message) {
    // Show local notification
  }
}

// Background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Background message: \${message.notification?.title}');
}''',
          'Complete FCM setup with foreground and background message handling.',
        ),
        const SizedBox(height: 16),
        _buildKeyPoints([
          'Free service that scales with your user base',
          'Support for both Android and iOS platforms',
          'Rich messaging features with custom data',
          'Topic-based and targeted messaging',
          'Integration with Firebase Console for easy management',
        ]),
      ],
    );
  }

  Widget _buildGoogleMapsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Google Maps Integration',
          'Embed interactive Google Maps in your Flutter app with location services and custom markers.',
        ),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Google Maps Implementation',
          '''// Dependencies: google_maps_flutter, geolocator

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  Position? _currentPosition;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentPosition = position;
      _markers.add(Marker(
        markerId: MarkerId('current'),
        position: LatLng(position.latitude, position.longitude),
        infoWindow: InfoWindow(title: 'You are here'),
      ));
    });

    mapController?.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(position.latitude, position.longitude),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(37.4219983, -122.084),
        zoom: 14.0,
      ),
      markers: _markers,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
    );
  }
}''',
          'Complete Google Maps integration with current location and markers.',
        ),
      ],
    );
  }

  Widget _buildDatabaseContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Database Solutions Comparison',
          'Choose the right database solution based on your app requirements: Hive, Isar, or SQLite.',
        ),
        const SizedBox(height: 20),
        _buildDatabaseComparison(
            'Hive', 'NoSQL key-value storage', 'Extremely fast binary storage', 'Simple data relationships'),
        const SizedBox(height: 12),
        _buildDatabaseComparison('Isar', 'NoSQL object-based storage', 'High performance with complex queries',
            'Rich features like indexes and relations'),
        const SizedBox(height: 12),
        _buildDatabaseComparison('SQLite', 'SQL relational database', 'Complex relationships and transactions',
            'Structured data with SQL queries'),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Hive Database Example',
          '''// 1. Define model
@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String name;
  
  @HiveField(1)
  int age;
  
  User(this.name, this.age);
}

// 2. Initialize Hive
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('users');
  runApp(MyApp());
}

// 3. CRUD Operations
class UserService {
  static Box<User> get _box => Hive.box<User>('users');

  static Future<void> addUser(User user) async {
    await _box.add(user);
  }

  static List<User> getAllUsers() {
    return _box.values.toList();
  }

  static Future<void> updateUser(int index, User user) async {
    await _box.putAt(index, user);
  }

  static Future<void> deleteUser(int index) async {
    await _box.deleteAt(index);
  }
}''',
          'Complete Hive database setup with CRUD operations.',
        ),
      ],
    );
  }

  Widget _buildTestingContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Flutter Testing Pyramid',
          'Comprehensive testing strategy with unit tests, widget tests, and integration tests.',
        ),
        const SizedBox(height: 20),
        _buildTestingType('Unit Testing', 'Test individual functions and methods in isolation'),
        _buildTestingType('Widget Testing', 'Test UI components and user interactions'),
        _buildTestingType('Integration Testing', 'Test complete app workflows'),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Widget Testing Example',
          '''import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  group('Counter Widget Tests', () {
    testWidgets('Counter increments smoke test', (WidgetTester tester) async {
      // Build our app and trigger a frame
      await tester.pumpWidget(MaterialApp(home: CounterPage()));

      // Verify that counter starts at 0
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the '+' icon and trigger a frame
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that counter has incremented
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('Counter button tap test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: CounterPage()));

      // Find the floating action button
      final fabFinder = find.byType(FloatingActionButton);
      expect(fabFinder, findsOneWidget);

      // Tap multiple times
      await tester.tap(fabFinder);
      await tester.pump();
      await tester.tap(fabFinder);
      await tester.pump();

      // Verify final state
      expect(find.text('2'), findsOneWidget);
    });
  });
}''',
          'Comprehensive widget testing with user interaction simulation.',
        ),
      ],
    );
  }

  Widget _buildPerformanceContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Flutter Performance Optimization',
          'Techniques to build fast, efficient Flutter applications that provide smooth user experiences.',
        ),
        const SizedBox(height: 20),
        _buildPerformanceTip('Widget Rebuilding', 'Use const constructors and avoid creating widgets in build methods'),
        _buildPerformanceTip(
            'State Management', 'Choose efficient state management and avoid unnecessary widget rebuilds'),
        _buildPerformanceTip('Image Optimization', 'Use appropriate image formats and implement image caching'),
        _buildPerformanceTip('List Performance', 'Use ListView.builder for large lists and implement pagination'),
        const SizedBox(height: 20),
        _buildCodeExample(
          'Firestore Performance Optimization',
          '''// ❌ Poor Performance
StreamBuilder(
  stream: FirebaseFirestore.instance
      .collection('posts')
      .snapshots(),
  builder: (context, snapshot) {
    // Loads all documents at once
    return ListView(children: snapshot.data.docs.map(...));
  },
)

// ✅ Optimized Performance
class OptimizedPostsList extends StatefulWidget {
  @override
  _OptimizedPostsListState createState() => _OptimizedPostsListState();
}

class _OptimizedPostsListState extends State<OptimizedPostsList> {
  Query get _query => FirebaseFirestore.instance
      .collection('posts')
      .orderBy('timestamp', descending: true)
      .limit(20); // Pagination

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _query.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          cacheExtent: 1000, // Preload items
          itemBuilder: (context, index) {
            return PostCard(
              post: snapshot.data!.docs[index],
              key: ValueKey(snapshot.data!.docs[index].id),
            );
          },
        );
      },
    );
  }
}''',
          'Optimizing Firestore queries with pagination and efficient list rendering.',
        ),
      ],
    );
  }

  Widget _buildDevelopmentToolsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Flutter Development Tools',
          'Essential tools and practices for efficient Flutter development.',
        ),
        const SizedBox(height: 20),
        _buildDevelopmentTool('Hot Reload', 'Quickly refresh UI while preserving app state',
            'Ideal for UI changes and minor code updates'),
        const SizedBox(height: 12),
        _buildDevelopmentTool('Hot Restart', 'Restart entire app, clearing all states',
            'Needed for significant changes like new dependencies'),
        const SizedBox(height: 12),
        _buildDevelopmentTool('SafeArea', 'Avoid overlap with device notches and system UI',
            'Essential for proper layout on modern devices'),
        const SizedBox(height: 20),
        _buildCodeExample(
          'SafeArea Implementation',
          '''class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Content that avoids notches
            AppBar(title: Text('Safe Layout')),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  // Your content here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Alternative: Selective SafeArea
SafeArea(
  top: true,    // Avoid top notch
  bottom: false, // Allow bottom overlap if needed
  child: YourWidget(),
)''',
          'Proper SafeArea usage to avoid device-specific layout issues.',
        ),
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

  Widget _buildLifecycleMethod(String method, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
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
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
                children: [
                  TextSpan(
                    text: '$method: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: screenColor,
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

  Widget _buildProviderType(String type, String description, String example) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: screenColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  type,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              example,
              style: GoogleFonts.sourceCodePro(
                fontSize: 12,
                color: const Color(0xFF7FB069),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComparisonSection(String title, String providerDesc, String riverpodDesc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
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
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF34495E),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Provider',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        providerDesc,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF34495E),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Riverpod',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        riverpodDesc,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDatabaseComparison(String name, String type, String performance, String useCase) {
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
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: screenColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  name,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                type,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '📈 Performance: $performance',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '🎯 Best for: $useCase',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestingType(String type, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
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
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: screenColor,
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

  Widget _buildPerformanceTip(String title, String description) {
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
              color: screenColor,
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

  Widget _buildDevelopmentTool(String tool, String description, String useCase) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF34495E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tool,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: screenColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '💡 $useCase',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.white60,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}