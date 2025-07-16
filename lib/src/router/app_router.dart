import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/content/flutter_content_screen.dart';
import '../screens/content/rust_content_screen.dart';
import '../screens/content/oop_content_screen.dart';
import '../screens/content/others_content_screen.dart';
import '../../main.dart';

// Global variable to track if we're coming from a content page
bool _lastPageWasContent = false;

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) {
        final scrollToCourses = state.uri.queryParameters['scrollTo'] == 'courses' || _lastPageWasContent;
        
        // Reset the flag when we reach home
        _lastPageWasContent = false;
        
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: LandingPage(scrollToCourses: scrollToCourses),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCubic).animate(animation),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 500),
        );
      },
    ),
    GoRoute(
      path: '/flutter',
      name: 'flutter',
      pageBuilder: (context, state) {
        _lastPageWasContent = true;
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: const FlutterContentScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(CurveTween(curve: Curves.easeInOutCubic).animate(animation)),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 600),
        );
      },
    ),
    GoRoute(
      path: '/rust',
      name: 'rust',
      pageBuilder: (context, state) {
        _lastPageWasContent = true;
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: const RustContentScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(CurveTween(curve: Curves.easeInOutCubic).animate(animation)),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 600),
        );
      },
    ),
    GoRoute(
      path: '/oop',
      name: 'oop',
      pageBuilder: (context, state) {
        _lastPageWasContent = true;
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: const OOPContentScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(CurveTween(curve: Curves.easeInOutCubic).animate(animation)),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 600),
        );
      },
    ),
    GoRoute(
      path: '/others',
      name: 'others',
      pageBuilder: (context, state) {
        _lastPageWasContent = true;
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: const OthersContentScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(CurveTween(curve: Curves.easeInOutCubic).animate(animation)),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 600),
        );
      },
    ),
  ],
);