import 'package:flutter/material.dart';

class DefaultScreen extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const DefaultScreen({
    super.key,
    this.padding = const EdgeInsets.all(8),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: child,
        ),
      ),
    );
  }
}
