import 'package:flutter/material.dart';
import '../models/content_item.dart';
import '../models/app_constants.dart';

class FlutterContent {
  static const List<ContentItem> items = [
    ContentItem(
      id: 'android_lifecycle',
      title: 'Android Lifecycle',
      subtitle: 'Understanding the Android activity lifecycle methods',
      description: 'Understanding the lifecycle methods that Android calls when an activity transitions between states.',
      icon: Icons.refresh,
      color: AppConstants.flutterColor,
      type: ContentType.steps,
      content: StepsContent(
        steps: [
          StepItem(
            title: 'onCreate',
            description: 'Called when the activity is first created.',
          ),
          StepItem(
            title: 'onStart',
            description: 'Called when the activity becomes visible to the user.',
          ),
          StepItem(
            title: 'onResume',
            description: 'Called when the activity starts interacting with the user.',
          ),
          StepItem(
            title: 'onPause',
            description: 'Called when activity is not visible to the user.',
          ),
          StepItem(
            title: 'onStop',
            description: 'Called when activity is no longer visible to the user.',
          ),
          StepItem(
            title: 'onRestart',
            description: 'Called after your activity is stopped, before starting.',
          ),
          StepItem(
            title: 'onDestroy',
            description: 'Called before the activity was destroyed.',
          ),
        ],
      ),
    ),
    ContentItem(
      id: 'widget_tree',
      title: 'Flutter Widget Tree',
      subtitle: 'How Flutter builds and manages widget hierarchies',
      description: 'Flutter builds UIs using a tree of widgets, where each widget describes what their view should look like.',
      icon: Icons.account_tree,
      color: AppConstants.flutterColor,
      type: ContentType.codeExample,
      content: CodeExampleContent(
        title: 'Basic Widget Tree',
        code: '''runApp -> MaterialApp or CupertinoApp -> Scaffold

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
        explanation: 'Widgets are composed in a hierarchical tree structure.',
      ),
    ),
    ContentItem(
      id: 'streams',
      title: 'Streams',
      subtitle: 'Asynchronous data handling with Dart streams',
      description: 'A way to receive asynchronous data events over time. Fundamental for handling sequences of data that arrive at different times.',
      icon: Icons.stream,
      color: AppConstants.flutterColor,
      type: ContentType.codeExample,
      content: CodeExampleContent(
        title: 'Stream Example',
        code: '''class CounterStream {
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
        explanation: 'Streams provide continuous flow of asynchronous data events.',
      ),
    ),
    ContentItem(
      id: 'isolates',
      title: 'Isolates',
      subtitle: 'Concurrent programming and heavy computation',
      description: 'Dart isolates provide true parallelism for CPU-intensive tasks without blocking the main UI thread.',
      icon: Icons.memory,
      color: AppConstants.flutterColor,
      type: ContentType.codeExample,
      content: CodeExampleContent(
        title: 'Compute Function (Simple Tasks)',
        code: '''int expensiveCalculation(int value) {
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
        explanation: 'Use compute() for simple CPU-intensive tasks.',
      ),
    ),
    ContentItem(
      id: 'riverpod',
      title: 'Riverpod State Management',
      subtitle: 'Modern state management with Riverpod providers',
      description: 'Riverpod offers different types of providers for various state management scenarios.',
      icon: Icons.settings_input_component,
      color: AppConstants.flutterColor,
      type: ContentType.keyPoints,
      content: KeyPointsContent(
        points: [
          'Provider: Read-only values that don\'t change',
          'StateProvider: Simple mutable state',
          'FutureProvider: Asynchronous operations',
          'StreamProvider: Continuous data flow',
          'StateNotifierProvider: Complex state logic',
        ],
      ),
    ),
    ContentItem(
      id: 'provider_vs_riverpod',
      title: 'Provider vs Riverpod',
      subtitle: 'Comparing different state management approaches',
      description: 'Understanding the differences between Provider and Riverpod for state management.',
      icon: Icons.compare_arrows,
      color: AppConstants.flutterColor,
      type: ContentType.comparison,
      content: ComparisonContent(
        items: [
          ComparisonItem(
            title: 'API Design',
            description: 'Provider: Based on InheritedWidget, requires more boilerplate\nRiverpod: More flexible API with compile-time safety',
          ),
          ComparisonItem(
            title: 'State Management',
            description: 'Provider: Uses ChangeNotifier for mutable state\nRiverpod: Encourages immutable state with StateNotifier',
          ),
          ComparisonItem(
            title: 'Testing',
            description: 'Provider: Complex widget trees for testing\nRiverpod: Easy mocking and provider overriding',
          ),
          ComparisonItem(
            title: 'Performance',
            description: 'Provider: Can lead to unnecessary rebuilds\nRiverpod: Optimized to avoid unnecessary rebuilds',
          ),
        ],
      ),
    ),
    ContentItem(
      id: 'method_channel',
      title: 'Method Channel',
      subtitle: 'Platform-specific code integration',
      description: 'Bridge for communication between Flutter and platform-specific code (Android/iOS).',
      icon: Icons.link,
      color: AppConstants.flutterColor,
      type: ContentType.codeExample,
      content: CodeExampleContent(
        title: 'Flutter Side',
        code: '''class ReverseStringScreen extends StatefulWidget {
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
        explanation: 'Define method channel and invoke platform methods.',
      ),
    ),
    ContentItem(
      id: 'navigation',
      title: 'Navigation (Go Router)',
      subtitle: 'Modern navigation with URL-based routing',
      description: 'Declarative routing solution with URL-based navigation, ideal for web apps and deep linking.',
      icon: Icons.navigation,
      color: AppConstants.flutterColor,
      type: ContentType.keyPoints,
      content: KeyPointsContent(
        points: [
          'Declarative routing aligned with Flutter\'s reactive model',
          'URL-based routing perfect for web applications',
          'Native support for deep linking',
          'Simplified nested navigation',
          'Dynamic parameters and query parameters',
          'Browser back/forward button support',
          'State restoration capabilities',
        ],
      ),
    ),
    ContentItem(
      id: 'custom_animations',
      title: 'Custom Animations',
      subtitle: 'Building beautiful animations with Flutter framework',
      description: 'Flutter provides a rich animation framework with AnimationController, Tween, and various animation widgets.',
      icon: Icons.animation,
      color: AppConstants.flutterColor,
      type: ContentType.keyPoints,
      content: KeyPointsContent(
        points: [
          'AnimationController manages animation timing and state',
          'Tween defines value ranges for animations',
          'CurvedAnimation adds easing effects',
          'AnimatedBuilder rebuilds widgets during animation',
          'Transform widgets handle geometric transformations',
        ],
      ),
    ),
    ContentItem(
      id: 'firebase',
      title: 'Firebase Integration',
      subtitle: 'Backend services with Firebase Cloud Messaging',
      description: 'FCM enables you to send push notifications to your Flutter app users across platforms.',
      icon: Icons.cloud,
      color: AppConstants.flutterColor,
      type: ContentType.keyPoints,
      content: KeyPointsContent(
        points: [
          'Free service that scales with your user base',
          'Support for both Android and iOS platforms',
          'Rich messaging features with custom data',
          'Topic-based and targeted messaging',
          'Integration with Firebase Console for easy management',
        ],
      ),
    ),
    ContentItem(
      id: 'google_maps',
      title: 'Google Maps Integration',
      subtitle: 'Location services and interactive maps',
      description: 'Embed interactive Google Maps in your Flutter app with location services and custom markers.',
      icon: Icons.map,
      color: AppConstants.flutterColor,
      type: ContentType.codeExample,
      content: CodeExampleContent(
        title: 'Google Maps Implementation',
        code: '''// Dependencies: google_maps_flutter, geolocator

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
        explanation: 'Complete Google Maps integration with current location and markers.',
      ),
    ),
    ContentItem(
      id: 'database',
      title: 'Database Solutions',
      subtitle: 'Local storage with Hive, Isar, and SQLite',
      description: 'Choose the right database solution based on your app requirements: Hive, Isar, or SQLite.',
      icon: Icons.storage,
      color: AppConstants.flutterColor,
      type: ContentType.comparison,
      content: ComparisonContent(
        items: [
          ComparisonItem(
            title: 'Hive',
            description: 'NoSQL key-value storage\nExtremely fast binary storage\nSimple data relationships',
          ),
          ComparisonItem(
            title: 'Isar',
            description: 'NoSQL object-based storage\nHigh performance with complex queries\nRich features like indexes and relations',
          ),
          ComparisonItem(
            title: 'SQLite',
            description: 'SQL relational database\nComplex relationships and transactions\nStructured data with SQL queries',
          ),
        ],
      ),
    ),
    ContentItem(
      id: 'testing',
      title: 'Testing in Flutter',
      subtitle: 'Unit, widget, and integration testing approaches',
      description: 'Comprehensive testing strategy with unit tests, widget tests, and integration tests.',
      icon: Icons.bug_report,
      color: AppConstants.flutterColor,
      type: ContentType.keyPoints,
      content: KeyPointsContent(
        points: [
          'Unit Testing: Test individual functions and methods in isolation',
          'Widget Testing: Test UI components and user interactions',
          'Integration Testing: Test complete app workflows',
        ],
      ),
    ),
    ContentItem(
      id: 'performance',
      title: 'Performance Optimization',
      subtitle: 'Building fast and efficient Flutter applications',
      description: 'Techniques to build fast, efficient Flutter applications that provide smooth user experiences.',
      icon: Icons.speed,
      color: AppConstants.flutterColor,
      type: ContentType.tips,
      content: TipsContent(
        tips: [
          TipItem(
            title: 'Widget Rebuilding',
            description: 'Use const constructors and avoid creating widgets in build methods',
          ),
          TipItem(
            title: 'State Management',
            description: 'Choose efficient state management and avoid unnecessary widget rebuilds',
          ),
          TipItem(
            title: 'Image Optimization',
            description: 'Use appropriate image formats and implement image caching',
          ),
          TipItem(
            title: 'List Performance',
            description: 'Use ListView.builder for large lists and implement pagination',
          ),
        ],
      ),
    ),
    ContentItem(
      id: 'development_tools',
      title: 'Development Tools & Tips',
      subtitle: 'Hot reload, SafeArea, and development best practices',
      description: 'Essential tools and practices for efficient Flutter development.',
      icon: Icons.build,
      color: AppConstants.flutterColor,
      type: ContentType.tips,
      content: TipsContent(
        tips: [
          TipItem(
            title: 'Hot Reload',
            description: 'Quickly refresh UI while preserving app state',
            useCase: 'Ideal for UI changes and minor code updates',
          ),
          TipItem(
            title: 'Hot Restart',
            description: 'Restart entire app, clearing all states',
            useCase: 'Needed for significant changes like new dependencies',
          ),
          TipItem(
            title: 'SafeArea',
            description: 'Avoid overlap with device notches and system UI',
            useCase: 'Essential for proper layout on modern devices',
          ),
        ],
      ),
    ),
  ];

  static List<ContentItem> getContentItems() => items;

  static ContentItem getContentItemById(String id) {
    return items.firstWhere(
      (item) => item.id == id,
      orElse: () => items.first,
    );
  }
}