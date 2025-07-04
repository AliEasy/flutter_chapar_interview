import 'package:flutter/material.dart';

class ScaffoldBottomNavigatorBarRootWidget extends StatelessWidget {
  final Widget child;

  const ScaffoldBottomNavigatorBarRootWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: child,
      ),
    );
  }
}
