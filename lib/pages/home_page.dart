import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_shellroute/router/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('HomePage'),
          ElevatedButton(
              onPressed: () {
                context.go('/dashboard/dashboard-detail');
                context.goNamed(PathName.dashboardDetail);
              },
              child: const Text('go to detail'))
        ],
      ),
    );
  }
}
