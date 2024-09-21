import 'package:flutter/material.dart';
import 'package:go_router_shellroute/pages/main_scaffold_page.dart';
import 'package:go_router_shellroute/router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppGoRouter.router,
     
    );
  
}
}
