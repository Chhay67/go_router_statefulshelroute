import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScaffoldPage extends StatefulWidget {
  const MainScaffoldPage({super.key,  this.navigationShell});
  final StatefulNavigationShell? navigationShell;
  @override
  State<MainScaffoldPage> createState() => _MainScaffoldPageState();
}

class _MainScaffoldPageState extends State<MainScaffoldPage> {
  void _goBranch(int index) {
    widget.navigationShell!.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell!.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            label: 'notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
        currentIndex: widget.navigationShell!.currentIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey.shade400,
        onTap: (index) {
          _goBranch(index);
        },
      ),
    );
  }
}
