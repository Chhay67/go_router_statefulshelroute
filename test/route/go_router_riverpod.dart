// import 'package:flutter/cupertino.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:go_router_shellroute/page/main_scaffold_page.dart';
// import 'package:go_router_shellroute/page/notificaiton_page.dart';
// import 'package:go_router_shellroute/page/profile_page.dart';
// import 'package:go_router_shellroute/provider/app_service_provider.dart';
// import 'package:go_router_shellroute/route/route.dart';

// import '../page/dashboard_detail_page.dart';
// import '../page/dashboard_page.dart';
// import '../page/login_page.dart';
// import '../page/new_feed_page.dart';
// import '../page/splash_page.dart';

// final _rootNavigatorKey = GlobalKey<NavigatorState>();
// final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
// final _shellNavigatorNewFeedKey = GlobalKey<NavigatorState>(debugLabel: 'newFeed');
// final _shellNavigatorNotificationKey = GlobalKey<NavigatorState>(debugLabel: 'notification');
// final _shellNavigatorProfileKey = GlobalKey<NavigatorState>(debugLabel: 'profile');


// final goRouterProvider = Provider<GoRouter>((ref) {
//   final appService = ref.watch(appServiceProvider);
//   return GoRouter(
//       navigatorKey: _rootNavigatorKey,
//       initialLocation: AppPaths.dashboard,
//       refreshListenable: appService,
//       debugLogDiagnostics: true,
//       redirect: (context, state) async{

//     final loginLocation = state.namedLocation(PathName.login);
//     final mainLocation = state.namedLocation(PathName.dashboard);
//     final splashLocation = state.namedLocation(PathName.splash);

//     final isLoggedIn = appService.loginState;
//     final isInitialized = appService.initialized;

//     final isGoingToLogin = state.matchedLocation == loginLocation;
//     final isGoingToInit = state.matchedLocation == splashLocation;

//     /// If not Initialized and not going to Initialized redirect to Splash
//     if (!isInitialized && !isGoingToInit) {
//       return splashLocation;

//       /// If not loggedIn and not going to login redirect to Login
//     } else if (isInitialized && !isLoggedIn && !isGoingToLogin) {
//       return loginLocation;
//       //
//       /// If all the scenarios are cleared but still going to any of that screen redirect to Home
//     } else if ((isLoggedIn && isGoingToLogin) ||
//         (isInitiaaalized && isGoingToInit)) {
//       return mainLocation;
//     } else {
//       /// Else Don't do anything
//       return null;
//     }

//   },
//       routes: [
//         GoRoute(
//           path: AppPaths.login,
//           name: PathName.login,
//           builder: (context, state) => const LoginPage(),
//         ),
//         GoRoute(
//           path: AppPaths.splash,
//           name: PathName.splash,
//           builder: (context, state) => const SplashPage(),
//         ),
//         StatefulShellRoute.indexedStack(

//           builder: (context, state, navigationShell) {
//             // Return the widget that implements the custom shell (e.g a BottomNavigationBar).
//             // The [StatefulNavigationShell] is passed to be able to navigate to other branches in a stateful way.

//             return MainScaffoldPage(
//               navigationShell: navigationShell,
//             );
//           },
//           branches: [
//             StatefulShellBranch(
//               navigatorKey: _shellNavigatorHomeKey,
//               // Add this branch routes
//               // each routes with its sub routes if available e.g feed/uuid/details
//               routes: <RouteBase>[
//                 GoRoute(
//                     path: AppPaths.dashboard,
//                     name: PathName.dashboard,
//                     builder: (context, state) => const DashBoardPage(),
//                     routes: [
//                       GoRoute(
//                         path: AppPaths.dashboardDetail,
//                         name: PathName.dashboardDetail,
//                         builder: (context, state) {

//                           return const DashBoardDetailPage();
//                         },
//                       )
//                     ]),
//               ],
//             ),
//             StatefulShellBranch(
//               navigatorKey: _shellNavigatorNewFeedKey,
//               // Add this branch routes
//               // each routes with its sub routes if available e.g feed/uuid/details
//               routes: <RouteBase>[
//                 GoRoute(
//                   path: AppPaths.newFeed,
//                   name: PathName.newFeed,
//                   builder: (context, state) => const NewFeedPage(),
//                 ),
//               ],
//             ),
//             StatefulShellBranch(
//               navigatorKey: _shellNavigatorNotificationKey,
//               // Add this branch routes
//               // each routes with its sub routes if available e.g feed/uuid/details
//               routes: <RouteBase>[
//                 GoRoute(
//                   path: AppPaths.notification,
//                   name: PathName.notification,
//                   builder: (context, state) => const NotificationPage(),
//                 ),
//               ],
//             ),
//             StatefulShellBranch(
//               navigatorKey: _shellNavigatorProfileKey,

//               routes: <RouteBase>[
//                 GoRoute(
//                   path: AppPaths.profile,
//                   name: PathName.profile,
//                   builder: (context, state) => const ProfilePage(),
//                 ),
//               ],
//             ),
//           ],
//         )
//       ]);
// });
