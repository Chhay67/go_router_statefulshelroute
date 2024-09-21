import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../route/route.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: [
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ListTile(
              onTap: (){
                context.go('/dashboard/board-details');
              },
              title: Text('Item #$index'),
            );
          },
          childCount: 50, // Number of items in the list
        ),
      ),
    ]);
  }
}
