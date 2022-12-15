
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screen/dashboard.dart';

final router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const DashboardScreen(
          title: "Dashboard",
        );
      },
    ),
  ],
);
