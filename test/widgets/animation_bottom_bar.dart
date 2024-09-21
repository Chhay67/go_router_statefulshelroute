import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimationBottomBar extends StatefulWidget {
  const AnimationBottomBar(
      {super.key, required this.scrollController, required this.child});
  final ScrollController scrollController;
  final Widget child;
  @override
  State<AnimationBottomBar> createState() => _AnimationBottomBarState();
}

class _AnimationBottomBarState extends State<AnimationBottomBar> {
  bool _isBottomBarVisible = true;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScrollListener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScrollListener);
    super.dispose();
  }

  void _onScrollListener() {
    if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      _showBottomAppBar();
    } else if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      _hideBottomAppBar();
    }
  }

  void _showBottomAppBar() {
    if (!_isBottomBarVisible) {
      setState(() {
        _isBottomBarVisible = true;
      });
    }
  }

  void _hideBottomAppBar() {
    if (_isBottomBarVisible) {
      setState(() {
        _isBottomBarVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.amber,
      duration: const Duration(milliseconds: 200),
      height: _isBottomBarVisible ? kBottomNavigationBarHeight : 0.0,
      child: Wrap(children:[ widget.child]),
    );
  }
}