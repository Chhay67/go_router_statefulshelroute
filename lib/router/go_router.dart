import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_shellroute/pages/error_page.dart';
import 'package:go_router_shellroute/pages/home_detail_page.dart';
import 'package:go_router_shellroute/pages/home_page.dart';
import 'package:go_router_shellroute/pages/main_scaffold_page.dart';
import 'package:go_router_shellroute/pages/notificaiton_page.dart';
import 'package:go_router_shellroute/pages/profile_page.dart';
import 'package:go_router_shellroute/pages/search_page.dart';
import 'package:go_router_shellroute/router/router.dart';

class AppGoRouter {
  static GoRouter get router => _goRouter;

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHomeKey =
      GlobalKey<NavigatorState>(debugLabel: 'home');
  static final _shellNavigatorSearchKey =
      GlobalKey<NavigatorState>(debugLabel: 'search');

  static final _shellNavigatorNotificationKey =
      GlobalKey<NavigatorState>(debugLabel: 'notification');
  static final _shellNavigatorProfileKey =
      GlobalKey<NavigatorState>(debugLabel: 'profile');
  static final GoRouter _goRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppPath.dashboard,
    debugLogDiagnostics: true,
    routes: [
      /// suitable for the bottomNavigationBar, nested routes, deep linking
      StatefulShellRoute.indexedStack(
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state, navigationShell) {
            return MainScaffoldPage(
              navigationShell: navigationShell,
            );
          },
          branches: [
            StatefulShellBranch(navigatorKey: _shellNavigatorHomeKey, routes: [
              GoRoute(
                  path: AppPath.dashboard,
                  name: PathName.dashboard,
                  builder: (context, state) {
                    return const HomePage();
                  },
                  routes: [
                    GoRoute(
                        path: AppPath.dashboardDetail,
                        name: PathName.dashboardDetail,
                        builder: (context, state) => const HomeDetailsPage(),
                        routes: []
                        )
                  ])
            ]),
            StatefulShellBranch(
                navigatorKey: _shellNavigatorSearchKey,
                routes: [
                  GoRoute(
                    path: AppPath.search,
                    name: PathName.search,
                    builder: (context, state) {
                      return const SearchPage();
                    },
                  )
                ]),
            StatefulShellBranch(
                navigatorKey: _shellNavigatorNotificationKey,
                routes: [
                  GoRoute(
                    path: AppPath.notification,
                    name: PathName.notification,
                    builder: (context, state) {
                      return const NotificationPage();
                    },
                  )
                ]),
            StatefulShellBranch(
                navigatorKey: _shellNavigatorProfileKey,
                routes: [
                  GoRoute(
                    path: AppPath.profile,
                    name: PathName.profile,
                    builder: (context, state) {
                      return const ProfilePage();
                    },
                  )
                ])
          ])
    ],
    errorBuilder: (context, state) => const ErorrPage(),
  );
}
