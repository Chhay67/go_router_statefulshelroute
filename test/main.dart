// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router_shellroute/route/go_router.dart';
// import 'package:go_router_shellroute/route/go_router_riverpod.dart';
//
// import 'observer/riverpod_observer.dart';
//
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp( ProviderScope(observers: [RiverpodObserver()],child: const MyApp()));
// }
//
//
// class MyApp extends ConsumerStatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   ConsumerState createState() => _MyAppState();
// }
//
// class _MyAppState extends ConsumerState<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//      final goRouter = ref.watch(goRouterProvider);
//
//     return MaterialApp.router(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       routerConfig: goRouter,
//     );
//   }
// }
//
