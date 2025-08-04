import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'base_content_screen.dart';
import '../../shared/widgets/content_index_tab.dart';

class OthersContentScreen extends BaseContentScreen {
  const OthersContentScreen({super.key});

  @override
  State<OthersContentScreen> createState() => _OthersContentScreenState();
}

class _OthersContentScreenState extends BaseContentScreenState<OthersContentScreen> {
  
  // Global keys for navigation
  final GlobalKey _dataStructuresKey = GlobalKey();
  final GlobalKey _cleanCodeKey = GlobalKey();
  final GlobalKey _gitKey = GlobalKey();
  final GlobalKey _architectureKey = GlobalKey();
  final GlobalKey _systemDesignKey = GlobalKey();

  @override
  String get screenTitle => 'Other Concepts';

  @override
  String get screenSubtitle => 'Discover additional programming concepts and technologies';

  @override
  IconData get screenIcon => Icons.psychology;

  @override
  Color get screenColor => const Color(0xFF673AB7);

  @override
  List<IndexItem> get indexItems => [
    IndexItem(
      id: 'data_structures',
      title: 'Data Structures & Algorithms',
      subtitle: 'Essential computer science fundamentals for efficient problem solving',
      icon: Icons.storage,
      color: const Color(0xFF673AB7),
      globalKey: _dataStructuresKey,
    ),
    IndexItem(
      id: 'clean_code',
      title: 'Clean Code Principles',
      subtitle: 'Writing maintainable, readable, and sustainable code',
      icon: Icons.code,
      color: const Color(0xFF673AB7),
      globalKey: _cleanCodeKey,
    ),
    IndexItem(
      id: 'git',
      title: 'Git & Version Control',
      subtitle: 'Professional development workflow and collaboration',
      icon: Icons.merge_type,
      color: const Color(0xFF673AB7),
      globalKey: _gitKey,
    ),
    IndexItem(
      id: 'architecture',
      title: 'Software Architecture Patterns',
      subtitle: 'Structural patterns for building scalable applications',
      icon: Icons.architecture,
      color: const Color(0xFF673AB7),
      globalKey: _architectureKey,
    ),
    IndexItem(
      id: 'system_design',
      title: 'System Design Basics',
      subtitle: 'Scalability, databases, caching, and distributed systems',
      icon: Icons.account_tree,
      color: const Color(0xFF673AB7),
      globalKey: _systemDesignKey,
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
          'Master essential programming concepts beyond the basics. Learn about data structures, clean code principles, version control, software architecture, and system design.',
          [],
          showBullets: false,
        ),

        const SizedBox(height: 32),

        // Core Concepts
        buildModuleCard(
          'Core Concepts',
          'Fundamental programming concepts for professional development',
          [
            'Data Structures & Algorithms',
            'Clean Code Principles',
            'Git & Version Control',
            'Software Architecture',
            'System Design',
          ],
          const Color(0xFF9C27B0),
          Icons.build,
        ),

        const SizedBox(height: 24),

        // Data Structures & Algorithms
        buildTopicCard(
          'Data Structures & Algorithms',
          'Essential computer science fundamentals for efficient problem solving',
          _buildDataStructuresContent(),
          key: _dataStructuresKey,
        ),
        
        const SizedBox(height: 24),
        
        // Clean Code Principles
        buildTopicCard(
          'Clean Code Principles',
          'Writing maintainable, readable, and sustainable code',
          _buildCleanCodeContent(),
          key: _cleanCodeKey,
        ),
        
        const SizedBox(height: 24),
        
        // Git & Version Control
        buildTopicCard(
          'Git & Version Control',
          'Professional development workflow and collaboration',
          _buildGitContent(),
          key: _gitKey,
        ),
        
        const SizedBox(height: 24),
        
        // Software Architecture Patterns
        buildTopicCard(
          'Software Architecture Patterns',
          'Structural patterns for building scalable applications',
          _buildArchitectureContent(),
          key: _architectureKey,
        ),
        
        const SizedBox(height: 24),
        
        // System Design Basics
        buildTopicCard(
          'System Design Basics',
          'Scalability, databases, caching, and distributed systems',
          _buildSystemDesignContent(),
          key: _systemDesignKey,
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

  Widget _buildDataStructuresContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Essential Data Structures',
          'Understanding data structures is crucial for writing efficient algorithms and solving complex problems.',
        ),
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Array and List Operations',
          '''// Array/List - Dynamic resizing
List<int> numbers = [1, 2, 3, 4, 5];
numbers.add(6);           // O(1) average
numbers.insert(0, 0);     // O(n)
numbers.removeAt(2);      // O(n)
print(numbers[0]);        // O(1) access

// Stack (LIFO) - Last In, First Out
class Stack<T> {
  final List<T> _items = [];
  
  void push(T item) => _items.add(item);
  T? pop() => _items.isNotEmpty ? _items.removeLast() : null;
  T? peek() => _items.isNotEmpty ? _items.last : null;
  bool get isEmpty => _items.isEmpty;
}

// Queue (FIFO) - First In, First Out
import 'dart:collection';
Queue<String> queue = Queue<String>();
queue.add("first");
queue.add("second");
String first = queue.removeFirst();

// Map (Hash Table) - Key-Value pairs
Map<String, int> scores = {
  'Alice': 95,
  'Bob': 87,
  'Charlie': 92
};
scores['Diana'] = 88;     // O(1) average insertion
int? aliceScore = scores['Alice']; // O(1) average lookup''',
          'Common data structures with their time complexities and use cases.',
        ),
        
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Tree and Graph Structures',
          '''// Binary Tree Node
class TreeNode<T> {
  T data;
  TreeNode<T>? left;
  TreeNode<T>? right;
  
  TreeNode(this.data);
}

// Binary Search Tree Operations
class BST<T extends Comparable<T>> {
  TreeNode<T>? root;
  
  void insert(T data) {
    root = _insertRec(root, data);
  }
  
  TreeNode<T> _insertRec(TreeNode<T>? node, T data) {
    if (node == null) return TreeNode(data);
    
    if (data.compareTo(node.data) < 0) {
      node.left = _insertRec(node.left, data);
    } else {
      node.right = _insertRec(node.right, data);
    }
    return node;
  }
  
  bool search(T data) => _searchRec(root, data);
  
  bool _searchRec(TreeNode<T>? node, T data) {
    if (node == null) return false;
    if (data == node.data) return true;
    
    return data.compareTo(node.data) < 0 
        ? _searchRec(node.left, data)
        : _searchRec(node.right, data);
  }
}

// Graph representation (Adjacency List)
class Graph {
  Map<int, List<int>> adjList = {};
  
  void addVertex(int vertex) {
    adjList[vertex] ??= [];
  }
  
  void addEdge(int from, int to) {
    adjList[from]?.add(to);
    adjList[to]?.add(from); // For undirected graph
  }
}''',
          'Tree and graph structures for hierarchical and network data representation.',
        ),
        
        const SizedBox(height: 16),
        
        _buildKeyPoints([
          'Arrays: O(1) access, O(n) insertion/deletion',
          'Linked Lists: O(1) insertion/deletion, O(n) search',
          'Hash Tables: O(1) average for all operations',
          'Trees: O(log n) operations in balanced trees',
          'Graphs: Model relationships and networks',
        ]),
      ],
    );
  }

  Widget _buildCleanCodeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Clean Code Principles',
          'Clean code is easy to read, understand, and maintain. It expresses intent clearly and follows consistent patterns.',
        ),
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Meaningful Names and Functions',
          '''// ❌ Bad: Unclear names and large function
void processData(List<dynamic> d) {
  for (var item in d) {
    if (item['status'] == 'active' && item['type'] == 'user') {
      item['lastLogin'] = DateTime.now().toString();
      item['notifications'] = getNotifications(item['id']);
      sendEmail(item['email'], generateWelcomeMessage(item));
    }
  }
}

// ✅ Good: Clear names and single responsibility
void updateActiveUsers(List<User> users) {
  final activeUsers = users.where(isActiveUser).toList();
  
  for (final user in activeUsers) {
    updateLastLogin(user);
    refreshNotifications(user);
    sendWelcomeEmail(user);
  }
}

bool isActiveUser(User user) {
  return user.status == UserStatus.active;
}

void updateLastLogin(User user) {
  user.lastLogin = DateTime.now();
}

void refreshNotifications(User user) {
  user.notifications = notificationService.getNotifications(user.id);
}

void sendWelcomeEmail(User user) {
  final message = emailTemplate.generateWelcomeMessage(user);
  emailService.send(user.email, message);
}''',
          'Break large functions into smaller, focused functions with descriptive names.',
        ),
        
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Error Handling and Null Safety',
          '''// ✅ Good: Explicit error handling
class UserService {
  Future<Result<User, UserError>> getUser(String id) async {
    if (id.isEmpty) {
      return Result.error(UserError.invalidId);
    }
    
    try {
      final userData = await database.getUser(id);
      if (userData == null) {
        return Result.error(UserError.notFound);
      }
      
      final user = User.fromJson(userData);
      return Result.success(user);
    } catch (e) {
      logger.error('Failed to get user \$id: \$e');
      return Result.error(UserError.databaseError);
    }
  }
}

// Result wrapper for better error handling
sealed class Result<T, E> {
  const Result();
  
  factory Result.success(T value) = Success;
  factory Result.error(E error) = Error;
}

class Success<T, E> extends Result<T, E> {
  final T value;
  const Success(this.value);
}

class Error<T, E> extends Result<T, E> {
  final E error;
  const Error(this.error);
}

enum UserError {
  invalidId,
  notFound,
  databaseError,
}''',
          'Use explicit error handling and null safety for robust applications.',
        ),
        
        const SizedBox(height: 16),
        
        _buildKeyPoints([
          'Use meaningful and descriptive names for variables and functions',
          'Keep functions small and focused on a single responsibility',
          'Write self-documenting code that explains the "why"',
          'Handle errors explicitly and use null safety features',
          'Follow consistent formatting and coding standards',
          'Write tests to document and verify behavior',
        ]),
      ],
    );
  }

  Widget _buildGitContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Git Workflow',
          'Git is a distributed version control system that tracks changes and enables collaboration in software development.',
        ),
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Essential Git Commands',
          '''# Initialize and basic operations
git init                          # Initialize repository
git clone <url>                   # Clone repository
git status                        # Check working directory status
git add .                         # Stage all changes
git add <file>                    # Stage specific file
git commit -m "feat: add login"   # Commit with message

# Branching and merging
git branch feature/user-auth      # Create branch
git checkout feature/user-auth    # Switch to branch
git checkout -b feature/new       # Create and switch
git merge feature/user-auth       # Merge branch
git branch -d feature/user-auth   # Delete branch

# Remote operations
git remote add origin <url>       # Add remote
git push origin main              # Push to remote
git pull origin main              # Pull from remote
git fetch origin                  # Fetch without merge

# Advanced operations
git rebase main                   # Rebase current branch
git cherry-pick <commit-hash>     # Apply specific commit
git stash                         # Temporarily save changes
git stash pop                     # Apply stashed changes''',
          'Common Git commands for daily development workflow.',
        ),
        
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Git Flow and Conventional Commits',
          '''# Git Flow branching model
main          # Production-ready code
develop       # Integration branch
feature/*     # New features
release/*     # Prepare new releases
hotfix/*      # Critical fixes

# Conventional commit format
<type>(<scope>): <description>

# Examples:
feat(auth): add OAuth2 login integration
fix(api): resolve null pointer exception in user service
docs(readme): update installation instructions
style(ui): improve button hover animations
refactor(utils): extract validation logic to separate module
test(auth): add unit tests for login component
chore(deps): update dependencies to latest versions

# Breaking changes
feat(api)!: redesign user authentication endpoint

BREAKING CHANGE: The authentication endpoint now requires
a different request format. Update your client accordingly.''',
          'Professional Git workflow with conventional commits for better collaboration.',
        ),
        
        const SizedBox(height: 16),
        
        _buildKeyPoints([
          'Use branches for features, fixes, and experiments',
          'Write clear, descriptive commit messages',
          'Review code through pull/merge requests',
          'Use conventional commits for automated changelog generation',
          'Keep commits atomic and logically grouped',
          'Use .gitignore to exclude unnecessary files',
        ]),
      ],
    );
  }

  Widget _buildArchitectureContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'Architecture Patterns',
          'Software architecture patterns provide proven structural solutions for organizing code and separating concerns.',
        ),
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Clean Architecture in Flutter',
          '''// Domain Layer - Business Logic
abstract class UserRepository {
  Future<User> getUser(String id);
  Future<void> saveUser(User user);
}

class GetUserUseCase {
  final UserRepository repository;
  
  GetUserUseCase(this.repository);
  
  Future<User> execute(String id) async {
    return repository.getUser(id);
  }
}

// Data Layer - External Dependencies
class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;
  final UserCache cache;
  
  UserRepositoryImpl(this.dataSource, this.cache);
  
  @override
  Future<User> getUser(String id) async {
    try {
      // Try cache first
      final cachedUser = await cache.getUser(id);
      if (cachedUser != null) return cachedUser;
      
      // Fetch from data source
      final user = await dataSource.getUser(id);
      await cache.saveUser(user);
      return user;
    } catch (e) {
      throw RepositoryException('Failed to get user: \$e');
    }
  }
}

// Presentation Layer - UI State Management
class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUseCase getUserUseCase;
  
  UserBloc(this.getUserUseCase) : super(UserInitial());
  
  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is LoadUser) {
      yield UserLoading();
      try {
        final user = await getUserUseCase.execute(event.id);
        yield UserLoaded(user);
      } catch (e) {
        yield UserError(e.toString());
      }
    }
  }
}''',
          'Clean Architecture separates business logic from external dependencies.',
        ),
        
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'MVC vs MVP vs MVVM',
          '''// MVC - Model View Controller
class UserController {
  final UserModel model;
  final UserView view;
  
  UserController(this.model, this.view);
  
  void loadUser(String id) {
    model.getUser(id).then((user) {
      view.displayUser(user);
    }).catchError((error) {
      view.displayError(error);
    });
  }
}

// MVP - Model View Presenter  
abstract class UserView {
  void showLoading();
  void showUser(User user);
  void showError(String message);
}

class UserPresenter {
  final UserView view;
  final UserRepository repository;
  
  UserPresenter(this.view, this.repository);
  
  Future<void> loadUser(String id) async {
    view.showLoading();
    try {
      final user = await repository.getUser(id);
      view.showUser(user);
    } catch (e) {
      view.showError(e.toString());
    }
  }
}

// MVVM - Model View ViewModel (with Riverpod)
class UserViewModel extends StateNotifier<UserState> {
  final UserRepository repository;
  
  UserViewModel(this.repository) : super(UserState.initial());
  
  Future<void> loadUser(String id) async {
    state = state.copyWith(isLoading: true);
    try {
      final user = await repository.getUser(id);
      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }
}''',
          'Different architectural patterns for organizing application logic.',
        ),
        
        const SizedBox(height: 16),
        
        _buildKeyPoints([
          'MVC: Controller handles user input and updates model/view',
          'MVP: Presenter mediates between view and model',
          'MVVM: ViewModel exposes data binding for the view',
          'Clean Architecture: Dependency inversion and layer separation',
          'Choose patterns based on team size and project complexity',
        ]),
      ],
    );
  }

  Widget _buildSystemDesignContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDefinitionBox(
          'System Design Fundamentals',
          'System design involves creating scalable, reliable, and maintainable software systems that can handle growth.',
        ),
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Scalability Patterns',
          '''// Load Balancing
class LoadBalancer {
  final List<Server> servers;
  int currentIndex = 0;
  
  LoadBalancer(this.servers);
  
  // Round-robin load balancing
  Server getNextServer() {
    final server = servers[currentIndex];
    currentIndex = (currentIndex + 1) % servers.length;
    return server;
  }
  
  // Health check
  List<Server> getHealthyServers() {
    return servers.where((server) => server.isHealthy).toList();
  }
}

// Caching Strategy
class CacheManager {
  final Map<String, CacheEntry> cache = {};
  final Duration defaultTTL = Duration(minutes: 15);
  
  Future<T?> get<T>(String key) async {
    final entry = cache[key];
    if (entry == null || entry.isExpired) {
      cache.remove(key);
      return null;
    }
    return entry.value as T;
  }
  
  void set(String key, dynamic value, {Duration? ttl}) {
    cache[key] = CacheEntry(
      value: value,
      expiry: DateTime.now().add(ttl ?? defaultTTL),
    );
  }
}

class CacheEntry {
  final dynamic value;
  final DateTime expiry;
  
  CacheEntry({required this.value, required this.expiry});
  
  bool get isExpired => DateTime.now().isAfter(expiry);
}''',
          'Implementing load balancing and caching for scalable systems.',
        ),
        
        const SizedBox(height: 20),
        
        _buildCodeExample(
          'Database Design Patterns',
          '''// Repository Pattern with Connection Pooling
class DatabasePool {
  final Queue<DatabaseConnection> availableConnections = Queue();
  final Set<DatabaseConnection> usedConnections = {};
  final int maxConnections = 10;
  
  Future<DatabaseConnection> getConnection() async {
    if (availableConnections.isNotEmpty) {
      final connection = availableConnections.removeFirst();
      usedConnections.add(connection);
      return connection;
    }
    
    if (usedConnections.length < maxConnections) {
      final connection = await DatabaseConnection.create();
      usedConnections.add(connection);
      return connection;
    }
    
    // Wait for available connection
    throw DatabaseException('Connection pool exhausted');
  }
  
  void releaseConnection(DatabaseConnection connection) {
    usedConnections.remove(connection);
    availableConnections.add(connection);
  }
}

// Database Sharding
class ShardedDatabase {
  final List<DatabaseConnection> shards;
  
  ShardedDatabase(this.shards);
  
  DatabaseConnection getShardForKey(String key) {
    final hash = key.hashCode.abs();
    final shardIndex = hash % shards.length;
    return shards[shardIndex];
  }
  
  Future<User?> getUser(String userId) async {
    final shard = getShardForKey(userId);
    return shard.query('SELECT * FROM users WHERE id = ?', [userId]);
  }
}

// Read Replicas
class DatabaseCluster {
  final DatabaseConnection master;
  final List<DatabaseConnection> readReplicas;
  
  DatabaseCluster(this.master, this.readReplicas);
  
  Future<void> write(String query, List<dynamic> params) async {
    return master.execute(query, params);
  }
  
  Future<List<Map<String, dynamic>>> read(String query, List<dynamic> params) async {
    final replica = readReplicas[Random().nextInt(readReplicas.length)];
    return replica.query(query, params);
  }
}''',
          'Database patterns for handling high load and ensuring data consistency.',
        ),
        
        const SizedBox(height: 16),
        
        _buildKeyPoints([
          'Horizontal scaling: Add more servers to handle increased load',
          'Vertical scaling: Increase server resources (CPU, RAM)',
          'Caching: Store frequently accessed data in memory',
          'Load balancing: Distribute requests across multiple servers',
          'Database sharding: Split data across multiple databases',
          'Microservices: Break monolith into smaller, independent services',
        ]),
      ],
    );
  }
}