import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../page/dashboard_detail_page.dart';
import '../page/dashboard_page.dart';
import '../page/main_scaffold_page.dart';
import '../page/new_feed_page.dart';
import 'route.dart';

import '../page/notificaiton_page.dart';
import '../page/profile_page.dart';
//

class AppGoRouter{
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
  static final _shellNavigatorNewFeedKey = GlobalKey<NavigatorState>(debugLabel: 'newFeed');

  static final _shellNavigatorNotificationKey = GlobalKey<NavigatorState>(debugLabel: 'notification');
  static final _shellNavigatorProfileKey = GlobalKey<NavigatorState>(debugLabel: 'profile');
    static GoRouter get router => _goRouter;
  static final GoRouter _goRouter =  GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: AppPaths.dashboard,
      debugLogDiagnostics: true,
      redirect: (context, state) async{

      },
      routes: [

        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            // Return the widget that implements the custom shell (e.g a BottomNavigationBar).
            // The [StatefulNavigationShell] is passed to be able to navigate to other branches in a stateful way.

            return MainScaffoldPage(
              navigationShell: navigationShell,
            );
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _shellNavigatorHomeKey,
              // Add this branch routes
              // each routes with its sub routes if available e.g feed/uuid/details
              routes: <RouteBase>[
                GoRoute(
                    path: AppPaths.dashboard,
                    builder: (context, state) => const DashBoardPage(),
                    routes: [
                      GoRoute(
                        path: AppPaths.dashboardDetail,
                        builder: (context, state) {

                          return const DashBoardDetailPage();
                        },
                      )
                    ]),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorNewFeedKey,
              // Add this branch routes
              // each routes with its sub routes if available e.g feed/uuid/details
              routes: <RouteBase>[
                GoRoute(
                  path: AppPaths.newFeed,
                  builder: (context, state) => const NewFeedPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorNotificationKey,
              // Add this branch routes
              // each routes with its sub routes if available e.g feed/uuid/details
              routes: <RouteBase>[
                GoRoute(
                  path: AppPaths.notification,
                  builder: (context, state) => const NotificationPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorProfileKey,

              routes: <RouteBase>[
                GoRoute(
                  path: AppPaths.profile,
                  builder: (context, state) => const ProfilePage(),
                ),
              ],
            ),
          ],
        )
      ],
      //errorPageBuilder: (context, state) => ,
      );
}

