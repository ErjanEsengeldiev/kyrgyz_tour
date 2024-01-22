import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/main/main_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const MainScreen();
        },
        // routes: <RouteBase>[],
      ),
    ],
  );
}
