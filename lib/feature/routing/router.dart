import 'package:firebase_storage_tuto/feature/authentication/ui/page/authentication.page.dart';
import 'package:firebase_storage_tuto/feature/event/ui/event.page.dart';
import 'package:firebase_storage_tuto/feature/user/ui/pages/user.profile.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
// GoRouter configuration
final routes = GoRouter(
  initialLocation: '/home',
  navigatorKey: _rootNavigatorKey,
  // initialLocation: '/messages/1',
  routes: [
    GoRoute(
      name: 'home',
      // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/home',
      builder: ((context, state) {
        return const SafeArea(child: AuthenticationPage());
      }),
    ),
    GoRoute(
      name: 'events',
      // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/events',
      builder: ((context, state) {
        return const EventPage();
      }),
    ),
    GoRoute(
      name: 'user-profile',
      // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/user-profile',
      builder: ((context, state) {
        return const UserProfilePage();
      }),
    ),
  ],
);
